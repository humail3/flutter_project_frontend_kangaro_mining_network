import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallet/screens/main_screen.dart';
import 'login_screen.dart';
import '../../components/button.dart';
import 'package:wallet/constants.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isLoading = false; // Track loading state

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animation = ColorTween(begin: kFirstColor, end: kBgWhiteColor).animate(_controller);
    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });

    // Check if user is already signed in
    _checkUserLogin();
  }

  Future<void> _checkUserLogin() async {
    User? user = _auth.currentUser;
    if (user != null) {
      // If a user is already logged in, navigate to the MainScreen
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      });
    }
  }

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;  // To show a loading spinner if you implement one
    });

    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        setState(() {
          _isLoading = false;
        });
        Fluttertoast.showToast(
          msg: "Sign-in cancelled by user",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      UserCredential userCredential = await _auth.signInWithCredential(credential);

      // Once signed in, store the user ID in Firestore
      User? user = userCredential.user;

      if (user != null) {
        print("User signed in: ${user.email}");

        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'email': user.email,
          'displayName': user.displayName,
          'photoURL': user.photoURL,
        });

        Fluttertoast.showToast(
          msg: "Account successfully created",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );

        // Navigate to the main screen
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        });
      }
    } catch (e) {
      print("Error signing in with Google: $e");
      Fluttertoast.showToast(
        msg: "Error signing in with Google: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Center(
                child: Image.asset(
                  'images/logo_nobg_crop.png',
                  width: 300.0,
                  height: 300.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Kangaroo Mining Network',
                      style: TextStyle(
                        color: kFirstColor,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w800,
                      )),
                  Text('A Gamified Ecosystem',
                      style: TextStyle(
                        color: kTextBlackColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 24.0),
                  Material(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(48.0),
                        topRight: Radius.circular(48.0)),
                    color: kSecondColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Material(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.0),
                            topRight: Radius.circular(32.0)),
                        color: kFirstColor,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Welcome...',
                                  style: TextStyle(
                                    color: kTextWhiteColor,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  )),
                              SizedBox(height: 8.0),
                              Center(
                                child: Text(
                                  'Please either login or sign up to continue',
                                  style: TextStyle(
                                    color: kTextWhiteColor,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: _isLoading
                                    ? Center(child: CircularProgressIndicator()) // Show spinner if loading
                                    : Button(
                                  title: 'Login With Google',
                                  textColour: Colors.redAccent,
                                  bgColour: kBgWhiteColor,
                                  icon: EvaIcons.google,
                                  iconColour: Colors.redAccent,
                                  iconSize: 32.0,
                                  function: _signInWithGoogle, // Call the Google Sign-In method
                                ),
                              ),
                              Center(
                                child: Text(
                                  'By logging in, you agree to the Terms & Conditions\n and Privacy Policy of the app',
                                  style: TextStyle(
                                    color: kTextBlackColor,
                                    fontSize: 12.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
