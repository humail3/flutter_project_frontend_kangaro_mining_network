// import 'package:flutter/material.dart';
//
// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:wallet/components/rounded_button.dart';
// import 'package:wallet/database/fetch_firebase_data.dart';
// import 'package:wallet/database/local_image/local_image.dart';
// import 'package:wallet/database/login_user.dart';
// import 'package:wallet/database/shared_preferences/user_data_shared_preferences.dart';
// import 'package:wallet/screens/authentication_screens/create_user_account.dart';
// import 'package:wallet/screens/main_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:wallet/constants.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// class OtpScreen extends StatefulWidget {
//   const OtpScreen({super.key});
//
//   static const String id = "otp_screen";
//
//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
//   // late String _email;
//   // late String _password;
//   // bool _isObscure = true;
//
//   final _otpController = TextEditingController();
//
//   // final _passwordController = TextEditingController();
//
//   // just define for not to remove the textfield values even after not foccused
//   // final _otpFocusNode = FocusNode();
//   // final _passwordFocusNode = FocusNode();
//
//   final _loginFormKey = GlobalKey<FormState>();
//
//   // FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   // FirebaseAuth _auth = FirebaseAuth.instance;
//   // FetchFirebaseData _fetchFirebaseData = FetchFirebaseData();
//   // LocalImage _localImage = LocalImage();
//
//   // Map<String, dynamic> userData = {};
//   // UserDataSharedPreferences _userDataSharedPreferences =
//   //     UserDataSharedPreferences();
//   // late AnimationController _controller; // Declare AnimationController
//   // bool _isSearching = false;
//
//   // void startAnimation() {
//   //   setState(() {
//   //     _isSearching = true;
//   //   });
//   //   _controller.forward();
//   // }
//   //
//   // void stopAnimation() {
//   //   setState(() {
//   //     _isSearching = false;
//   //   });
//   //   _controller.stop();
//   // }
//
//   Future<void> _navigateToMainScreen() async {
//     // userData =
//     //     await _fetchFirebaseData.fetchUserDataFromFirestore(userEmail: _email);
//     //
//     // await _userDataSharedPreferences.setUserDataAtPrefs(
//     //     username: userData['username'],
//     //     email: userData['email'],
//     //     name: userData['name'],
//     //     field: userData['field'],
//     //     address: userData['address'],
//     //     currentLocation: userData['currentLocation'],
//     //     phoneNo: userData['phoneNo'],
//     //     expertiseDescription: userData['expertiseDescription'],
//     //     lati: userData['latitude'],
//     //     longi: userData['longitude'],
//     //     imageUrl: userData['profileImageUrl'],
//     //     service: userData['service'],
//     //     premiumUser: userData['premiumUser']);
//
//     // try {
//     //   File? image = await _localImage.downloadImage(
//     //       imageUrl: userData['profileImageUrl']);
//     //   if (image != null) {
//     //     await _localImage.saveImage(image: image, imageName: 'userImage');
//     //     print("Image saved successfully.");
//     //   } else {
//     //     print("Failed to download image.");
//     //   }
//     // } catch (e) {
//     //   print("Error in image handling: $e");
//     // }
// // Reset form fields and text controllers
//     _otpController.clear();
//     // _passwordController.clear();
//
//     // stopAnimation();
//     // Navigator.popUntil(context, (route) => route.isFirst);
//     // Navigator.pushReplacementNamed(context, CreateUserAccount.id);
//     Navigator.pushNamed(context, CreateUserAccount.id);
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     // _otpFocusNode.dispose();
//     // _passwordFocusNode.dispose();
//     // _controller.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: SingleChildScrollView(
//             child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   Container(
//                       width: double.infinity,
//                       margin: EdgeInsets.symmetric(vertical: 32.0),
//                       child: Image.asset(
//                         'images/logo_nobg_crop.png',
//                         width: 150.0,
//                         height: 150.0,
//                       )),
//                   Text(
//                     'Email Verification\nCode',
//                     style: TextStyle(
//                       color: kFirstColor,
//                       fontSize: 28.0,
//                       fontWeight: FontWeight.w800,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(
//                     height: 16.0,
//                   ),
//                   Text.rich(
//                     TextSpan(
//                       text: 'A verification code has been sent to\n',
//                       // The first part of the text
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 16.0,
//                       ),
//                       children: [
//                         TextSpan(
//                           text: 'your email',
//                           // The part of the text you want to style differently
//                           style: TextStyle(
//                             color: kTextBlackColor,
//                             fontWeight: FontWeight
//                                 .bold, // The specific color for "Kangaroo Mining Network"
//                           ),
//                         ),
//                       ],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(
//                     height: 50.0,
//                   ),
//                   PinCodeTextField(
//                     appContext: context,
//                     length: 6,
//                     obscureText: false,
//                     animationType: AnimationType.fade,
//                     pinTheme: PinTheme(
//                       shape: PinCodeFieldShape.box,
//                       borderRadius: BorderRadius.circular(5),
//                       fieldHeight: 50,
//                       fieldWidth: 40,
//                       activeFillColor: Colors.white,
//                       selectedFillColor: Colors.white,
//                       inactiveFillColor: Colors.white,
//                     ),
//                     animationDuration: Duration(milliseconds: 300),
//                     backgroundColor: Colors.transparent,
//                     enableActiveFill: true,
//                     controller: _otpController,
//                     keyboardType: TextInputType.number,
//                     onCompleted: (value) {
//                       // Do something with the completed OTP value
//                       print("Completed: " + value);
//                     },
//                     onChanged: (value) {
//                       // Update the value as the user types
//                       print(value);
//                     },
//                     validator: (value) {
//                       if (value == null || value.length < 6) {
//                         return 'Enter a valid 6-digit OTP';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: 24.0,
//                   ),
//                   RoundedButton('Verify & Proceed', kFirstColor, () async {
//                     // Validate form fields
//                     // if (_loginFormKey.currentState!.validate()) {
//                     //   _loginFormKey.currentState!.save();
//                     //
//                     // startAnimation();
//                     // bool isLoggedIn = await _loginUser.emailAndPasswordAuth
//                     //   (
//                     //     _email, _password);
//                     // if (isLoggedIn) {
//                     //   // Retrieve the current user
//                     //   User? user = _auth.currentUser;
//                     //   if (user != null) {
//                     //     // uid = user.uid; // Set the user ID
//                     _navigateToMainScreen();
//                     //   }
//                     // } else {
//                     //   print("User cannot login");
//                     // }
//                     // }
//                   }),
//                   SizedBox(
//                     height: 24.0,
//                   ),
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
