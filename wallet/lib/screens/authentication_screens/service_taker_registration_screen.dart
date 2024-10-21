// import 'dart:convert';
// import 'dart:io';
//
// import 'package:wallet/components/h2_text.dart';
// import 'package:wallet/database/register_service_taker.dart';
// import 'package:wallet/screens/main_screen.dart';
// // import 'package:wallet/services/location.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:wallet/components/rounded_button.dart';
// import 'package:wallet/constants.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:http/http.dart' as http;
//
// class ServiceTakerRegistrationScreen extends StatefulWidget {
//   const ServiceTakerRegistrationScreen({super.key});
//
//   static const String id = "service_taker_registration_screen";
//
//   @override
//   _ServiceTakerRegistrationScreenState createState() =>
//       _ServiceTakerRegistrationScreenState();
// }
//
// class _ServiceTakerRegistrationScreenState
//     extends State<ServiceTakerRegistrationScreen>
//     with TickerProviderStateMixin {
//   late String _username;
//   late String _email;
//   late String _password;
//   String? _name;
//   String? _address;
//
//   String? _currentLocation;
//
//   // RegisterServiceTaker _registerServiceTaker = new RegisterServiceTaker();
//   bool _isObscure = true;
//   // Location _location = Location();
//   double? _lati;
//   double? _longi;
//
//   final _usernameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _nameController = TextEditingController();
//   final _addressController = TextEditingController();
//   TextEditingController _locationController = TextEditingController();
//
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//   String? _base64Image;
//   String? _imageError;
//
//   // just define for not to remove the textfield values even after not foccused
//   final _usernameFocusNode = FocusNode();
//   final _emailFocusNode = FocusNode();
//   final _passwordFocusNode = FocusNode();
//   final _nameFocusNode = FocusNode();
//   final _addressFocusNode = FocusNode();
//
//   final _serviceTakerRegistrationFormKey = GlobalKey<FormState>();
//   late AnimationController _controller; // Declare AnimationController
//   bool _isSearching = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//         vsync: this, duration: Duration(seconds: 2)); // Use this.vsync
//   }
//
//   void startAnimation() {
//     setState(() {
//       _isSearching = true;
//     });
//     _controller.forward();
//   }
//
//   void stopAnimation() {
//     setState(() {
//       _isSearching = false;
//     });
//     _controller.stop();
//   }
//
//   void _navigateToMainScreen() {
//     // Reset form fields and text controllers
//     _usernameController.clear();
//     _emailController.clear();
//     _passwordController.clear();
//     _nameController.clear();
//     _addressController.clear();
//     _locationController.clear();
//
//     stopAnimation();
//     Navigator.popUntil(context, (route) => route.isFirst);
//     Navigator.pushReplacementNamed(context, MainScreen.id);
//   }
//
//   // Future<void> _getLocationData() async {
//   //   await _location.getCurrentLocation();
//   //
//   //   _currentLocation =
//   //       '${_location.town!}, ${_location.city!}, ${_location.district!}';
//   //
//   //   _lati = _location.latitude!;
//   //   _longi = _location.longitude!;
//   //
//   //   setState(() {
//   //     // Update UI with location details
//   //     _locationController.text = _currentLocation!;
//   //   });
//   // }
//
//   Future<void> _checkLocationPermission() async {
//     PermissionStatus status = await Permission.locationWhenInUse.request();
//     if (status.isGranted) {
//       print('Location permission granted');
//       // await _getLocationData(); // Call _getLocationData here
//     } else if (status.isDenied || status.isPermanentlyDenied) {
//       print('Location permission denied');
//       openAppSettings();
//     }
//   }
//
//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       // Convert XFile to File
//       final File file = File(pickedFile.path);
//
//       final compressedFilePath = file.path + '_compressed.jpg';
//       final result = await FlutterImageCompress.compressAndGetFile(
//         file.path,
//         compressedFilePath,
//         quality: 85,
//       );
//
//       if (result != null) {
//         final File compressedFile = File(result.path);
//         setState(() {
//           _image = compressedFile;
//           _base64Image = base64Encode(compressedFile.readAsBytesSync());
//         });
//       }
//     } else {
//       print('No image selected.');
//     }
//   }
//
//   bool _isImageSelected() {
//     return _image != null;
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _usernameFocusNode.dispose();
//     _emailFocusNode.dispose();
//     _passwordFocusNode.dispose();
//     _nameFocusNode.dispose();
//     _addressFocusNode.dispose();
//     _controller.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(children: [
//             SizedBox(height: 16.0),
//             Hero(
//               tag: 'logo',
//               child: Container(
//                 height: 150.0,
//                 child: Image.asset('images/logo_transparent.png'),
//               ),
//             ),
//             const Center(
//               child: Text('Service Taker',
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontSize: 30.0,
//                     fontWeight: FontWeight.w600,
//                   )),
//             ),
//             Form(
//               key: _serviceTakerRegistrationFormKey,
//               child: Expanded(
//                 child: ListView(children: [
//                   H2Text(
//                     title: 'Account details',
//                     edgeInsets: EdgeInsets.only(top: 24.0, bottom: 16.0),
//                   ),
//                   TextFormField(
//                     controller: _usernameController,
//                     focusNode: _usernameFocusNode,
//                     style: TextStyle(color: kTextBlackColor),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your username';
//                       }
//                       return null;
//                     },
//                     onChanged: (value) {
//                       _username = value;
//                     },
//                     autofillHints: [AutofillHints.username],
//                     decoration: kTextFieldDecoration.copyWith(
//                         hintText: 'Enter your username'),
//                   ),
//                   const SizedBox(
//                     height: 8.0,
//                   ),
//                   TextFormField(
//                     controller: _emailController,
//                     focusNode: _emailFocusNode,
//                     style: TextStyle(color: kTextBlackColor),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       // Simple regex for email validation
//                       String pattern =
//                           r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
//                       RegExp regex = RegExp(pattern);
//                       if (!regex.hasMatch(value)) {
//                         return 'Enter a valid email address';
//                       }
//                       return null;
//                     },
//                     onChanged: (value) {
//                       _email = value;
//                     },
//                     autofillHints: [AutofillHints.email],
//                     decoration: kTextFieldDecoration.copyWith(
//                         hintText: 'Enter your email'),
//                   ),
//                   const SizedBox(
//                     height: 8.0,
//                   ),
//                   TextFormField(
//                     controller: _passwordController,
//                     focusNode: _passwordFocusNode,
//                     style: TextStyle(color: kTextBlackColor),
//                     obscureText: _isObscure,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a password';
//                       }
//                       if (value.length < 6) {
//                         return 'Password must be at least 6 characters';
//                       }
//                       return null;
//                     },
//                     onChanged: (value) {
//                       _password = value;
//                     },
//                     autofillHints: [AutofillHints.newPassword],
//                     decoration: kTextFieldDecoration.copyWith(
//                       hintText: 'Enter your password',
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _isObscure ? Icons.visibility : Icons.visibility_off,
//                           color: kTextBlackColor,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _isObscure = !_isObscure;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   H2Text(
//                     title: 'Profile details',
//                     edgeInsets: EdgeInsets.only(top: 24.0, bottom: 16.0),
//                   ),
//                   TextFormField(
//                     controller: _nameController,
//                     focusNode: _nameFocusNode,
//                     keyboardType: TextInputType.name,
//                     style: TextStyle(color: kTextBlackColor),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                     onChanged: (value) {
//                       _name = value;
//                     },
//                     autofillHints: [AutofillHints.name],
//                     decoration: kTextFieldDecoration.copyWith(
//                         hintText: 'Enter your Name'),
//                   ),
//                   const SizedBox(
//                     height: 8.0,
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.streetAddress,
//                     controller: _addressController,
//                     focusNode: _addressFocusNode,
//                     style: TextStyle(color: kTextBlackColor),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your address';
//                       }
//                       return null;
//                     },
//                     onChanged: (value) {
//                       _address = value;
//                     },
//                     autofillHints: [AutofillHints.fullStreetAddress],
//                     decoration: kTextFieldDecoration.copyWith(
//                         hintText: 'Enter your Address'),
//                   ),
//                   const SizedBox(height: 8.0),
//                   Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: _locationController,
//                         readOnly: true,
//                         style: TextStyle(color: kTextBlackColor),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please select your location';
//                           }
//                           return null;
//                         },
//                         decoration: kTextFieldDecoration.copyWith(
//                             hintText: 'Select your location'),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: RoundedButton('Get', kSecondColor, () async {
//                         await _checkLocationPermission();
//                       }),
//                     ),
//                   ]),
//                   const SizedBox(
//                     height: 24.0,
//                   ),
//                   Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//                     Expanded(
//                       child: Column(children: [
//                         DecoratedBox(
//                           decoration: kTextDecoration,
//                           child: _image == null
//                               ? Padding(
//                                   padding: EdgeInsets.all(16.0),
//                                   child: Text(
//                                     'Your profile image',
//                                     style: TextStyle(
//                                         color: kHintColor,
//                                         fontSize: 15.0,
//                                         fontWeight: FontWeight.bold),
//                                   ))
//                               : Padding(
//                                   padding: EdgeInsets.all(16.0),
//                                   child: Image.file(
//                                     _image!,
//                                     height: 150.0,
//                                   ),
//                                 ),
//                         ),
//                         if (_imageError != null)
//                           Text(
//                             _imageError!,
//                             style: TextStyle(color: Colors.red, fontSize: 12.0),
//                           ),
//                       ]),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: RoundedButton(
//                         'Select Image',
//                         kSecondColor,
//                         () async {
//                           _pickImage();
//                           setState(() {
//                             _imageError =
//                                 null; // Clear error when an image is picked
//                           });
//                         },
//                       ),
//                     ),
//                   ]),
//                   SizedBox(
//                     height: 24.0,
//                   ),
//                   RoundedButton('Create Account', kSecondColor, () async {
//                     // Validate form fields
//                     if (_serviceTakerRegistrationFormKey.currentState!
//                         .validate()) {
//                       // if (_isImageSelected()) {
//                       //   // Proceed with form submission, including the image upload,,,, e.g., call your registration method here
//                       //
//                       //   _serviceTakerRegistrationFormKey.currentState!.save();
//
//                         // startAnimation();
//                         // await _registerServiceTaker.createNewUser(
//                         //   username: _username,
//                         //   email: _email,
//                         //   password: _password,
//                         //   name: _name,
//                         //   address: _address,
//                         //   currentLocation: _currentLocation,
//                         //   lati: _lati,
//                         //   longi: _longi,
//                         //   image: _image,
//                         // )
//                         //     ? _navigateToMainScreen()
//                         //     : print('User Registration Failed');
//                       // } else {
//                       //   Show an error message /or validation feedback
//                         // setState(() {
//                         //   _imageError = "Please select a profile image";
//                         // });
//                       // }
//                     }
//                   })
//                 ]),
//               ),
//             ),
//           ]),
//         ),
//       ]),
//     );
//   }
// }
