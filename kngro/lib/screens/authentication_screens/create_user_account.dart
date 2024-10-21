import 'package:flutter/material.dart';
import 'package:kngro/screens/main_screen.dart';

import '../../components/rounded_button.dart';
import '../../constants.dart';

class CreateUserAccount extends StatefulWidget {
  const CreateUserAccount({super.key});

  static const String id = "create_user_account";

  @override
  State<CreateUserAccount> createState() => _CreateUserAccountState();
}

class _CreateUserAccountState extends State<CreateUserAccount> {
  // late String _email;
  late String _password;
  bool _isObscure = true;

  // final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // just define for not to remove the textfield values even after not focused
  // final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  final _loginFormKey = GlobalKey<FormState>();

  // FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // FirebaseAuth _auth = FirebaseAuth.instance;
  // FetchFirebaseData _fetchFirebaseData = FetchFirebaseData();
  // LocalImage _localImage = LocalImage();

  // Map<String, dynamic> userData = {};
  // UserDataSharedPreferences _userDataSharedPreferences =
  //     UserDataSharedPreferences();
  // late AnimationController _controller; // Declare AnimationController
  // bool _isSearching = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = AnimationController(
  //       vsync: this, duration: Duration(seconds: 2)); // Use this.vsync
  // }

  // void startAnimation() {
  //   setState(() {
  //     _isSearching = true;
  //   });
  //   _controller.forward();
  // }
  //
  // void stopAnimation() {
  //   setState(() {
  //     _isSearching = false;
  //   });
  //   _controller.stop();
  // }

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
//     _emailController.clear();
    _passwordController.clear();

    // stopAnimation();
    // Navigator.popUntil(context, (route) => route.isFirst);
    // Navigator.pushReplacementNamed(context, OtpScreen.id);
    Navigator.pushNamed(context, MainScreen.id);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    // _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 32.0),
                    child: Image.asset(
                      'images/logo_nobg_crop.png',
                      width: 150.0,
                      height: 150.0,
                    )),
                Text(
                  'Create\nUser Account',
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
                    text:
                        'Make 2 Names for yourself. One is to be\nheard, Another OneFor your login',
                    // The first part of the text
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text('NAME',style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  // controller: _emailController,
                  // focusNode: _emailFocusNode,
                  style: TextStyle(color: kTextBlackColor),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your Name';
                    }
                    // Simple regex for email validation
                    String pattern =
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // _email = value;
                  },
                  autofillHints: [AutofillHints.email],
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter Name',
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text('USER NAME',style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  // controller: _emailController,
                  // focusNode: _emailFocusNode,
                  style: TextStyle(color: kTextBlackColor),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter User Name';
                    }
                    // Simple regex for email validation
                    String pattern =
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid username';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // _email = value;
                  },
                  autofillHints: [AutofillHints.email],
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter Username',
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text('REFERAL CODE',style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  // controller: _emailController,
                  // focusNode: _emailFocusNode,
                  style: TextStyle(color: kTextBlackColor),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter referral code';
                    }
                    // Simple regex for email validation
                    String pattern =
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid referral code';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // _email = value;
                  },
                  autofillHints: [AutofillHints.email],
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter Referral Code',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
