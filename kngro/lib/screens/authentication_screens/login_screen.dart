import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:kngro/components/rounded_button.dart';
import 'package:kngro/database/fetch_firebase_data.dart';
import 'package:kngro/database/local_image/local_image.dart';
import 'package:kngro/database/login_user.dart';
import 'package:kngro/database/shared_preferences/user_data_shared_preferences.dart';
import 'package:kngro/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kngro/constants.dart';

import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late String _email;
  late String _password;
  bool _isObscure = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // just define for not to remove the textfield values even after not foccused
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  final _loginFormKey = GlobalKey<FormState>();

  // FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // FirebaseAuth _auth = FirebaseAuth.instance;
  // FetchFirebaseData _fetchFirebaseData = FetchFirebaseData();
  // LocalImage _localImage = LocalImage();

  // Map<String, dynamic> userData = {};
  // UserDataSharedPreferences _userDataSharedPreferences =
  //     UserDataSharedPreferences();
  late AnimationController _controller; // Declare AnimationController
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: 2)); // Use this.vsync
  }

  void startAnimation() {
    setState(() {
      _isSearching = true;
    });
    _controller.forward();
  }

  void stopAnimation() {
    setState(() {
      _isSearching = false;
    });
    _controller.stop();
  }

  Future<void> _navigateToOtpScreen() async {
    // userData =
    //     await _fetchFirebaseData.fetchUserDataFromFirestore(userEmail: _email);
    //
    // await _userDataSharedPreferences.setUserDataAtPrefs(
    //     username: userData['username'],
    //     email: userData['email'],
    //     name: userData['name'],
    //     field: userData['field'],
    //     address: userData['address'],
    //     currentLocation: userData['currentLocation'],
    //     phoneNo: userData['phoneNo'],
    //     expertiseDescription: userData['expertiseDescription'],
    //     lati: userData['latitude'],
    //     longi: userData['longitude'],
    //     imageUrl: userData['profileImageUrl'],
    //     service: userData['service'],
    //     premiumUser: userData['premiumUser']);

    // try {
    //   File? image = await _localImage.downloadImage(
    //       imageUrl: userData['profileImageUrl']);
    //   if (image != null) {
    //     await _localImage.saveImage(image: image, imageName: 'userImage');
    //     print("Image saved successfully.");
    //   } else {
    //     print("Failed to download image.");
    //   }
    // } catch (e) {
    //   print("Error in image handling: $e");
    // }
// Reset form fields and text controllers
    _emailController.clear();
    _passwordController.clear();

    stopAnimation();
    // Navigator.popUntil(context, (route) => route.isFirst);
    // Navigator.pushReplacementNamed(context, OtpScreen.id);
    Navigator.pushNamed(context, OtpScreen.id);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: <Widget>[
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 32.0),
                  child: Image.asset(
                    'images/logo_nobg_crop.png',
                    width: 150.0,
                    height: 150.0,
                  )),
              Text(
                'Enter Your\nEmail Address',
                style: TextStyle(
                  color: kFirstColor,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text.rich(
                TextSpan(
                  text: 'Please enter your email to begin using\nthe ',
                  // The first part of the text
                  style: TextStyle(
                    color: kTextBlackColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: '"Kangaroo Mining Network"',
                      // The part of the text you want to style differently
                      style: TextStyle(
                        color:
                            kFirstColor, // The specific color for "Kangaroo Mining Network"
                      ),
                    ),
                    TextSpan(
                      text: ' app',
                      // The part of the text you want to style differently
                      style: TextStyle(
                        color: kTextBlackColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.0,
              ),
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                style: TextStyle(color: kTextBlackColor),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Simple regex for email validation
                  String pattern =
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                onChanged: (value) {
                  _email = value;
                },
                autofillHints: [AutofillHints.email],
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter Email Address',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton('Login', kFirstColor, () async {
                // Validate form fields
                // if (_loginFormKey.currentState!.validate()) {
                //   _loginFormKey.currentState!.save();
                    
                // startAnimation();
                // bool isLoggedIn = await _loginUser.emailAndPasswordAuth
                //   (
                //     _email, _password);
                // if (isLoggedIn) {
                //   // Retrieve the current user
                //   User? user = _auth.currentUser;
                //   if (user != null) {
                //     // uid = user.uid; // Set the user ID
                _navigateToOtpScreen();
                //   }
                // } else {
                //   print("User cannot login");
                // }
                // }
              }),
              SizedBox(
                height: 24.0,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
