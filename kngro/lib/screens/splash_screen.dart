// import 'package:flutter/material.dart';
// import 'package:kngro/screens/authentication_screens/welcome_screen.dart';
// // import 'package:video_player/video_player.dart';
// // import 'package:connectivity_plus/connectivity_plus.dart';
// // import 'package:ewages/constants.dart';
// // import 'package:ewages/database/login_user.dart';
// // import 'package:ewages/screens/authentication_screens/welcome_screen.dart';
// // import 'package:ewages/screens/main_screen.dart';
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   static const String id = 'splash_screen';
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   // late VideoPlayerController _videoController;
//   bool _isSearching = true;
//   // LoginUser _loginUser = LoginUser();
//
//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: Duration(seconds: 2));
//     // _videoController = VideoPlayerController.asset('videos/logo_animated.mp4')
//     //   ..initialize().then((_) {
//     //     setState(() {});
//     //     _videoController.play();
//     //     _videoController.setLooping(true);
//     //   });
//     checkInternet();
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
//   Future<void> checkUser() async {
//     startAnimation();
//     // Introduce a 5-second delay before navigating
//     await Future.delayed(Duration(seconds: 5));
//       // bool isLoggedIn = await _loginUser.checkUserLoginOrNot();
//       // if (isLoggedIn) {
//       //   Navigator.pushReplacementNamed(context, MainScreen.id);
//       // } else {
//         Navigator.pushReplacementNamed(context, WelcomeScreen());
//         // print('user is not Logged In');
//       // }
//       stopAnimation();
//     }
//
//   Future<void> checkInternet() async {
//     startAnimation();
//
//     final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult.contains(ConnectivityResult.none)) {
//       print('connectivity $ConnectivityResult');
//       stopAnimation();
//
//       // Ensure the context is accessible within the check
//       if (context != null) {
//         // Show the dialog and wait for user confirmation before continuing
//         await showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               backgroundColor: kSecondColor,
//               title: Text("No Internet Connection",style: TextStyle(color: kTextWhiteColor),),
//               content: Text("Please check your internet connection.",style: TextStyle(color: kTextWhiteColor),),
//               actions: <Widget>[
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
//                   child: Container(
//                     color: kFourthColor,
//                     child: Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: TextButton(
//                         child: Text("OK", style: TextStyle(color: kTextBlackColor,fontSize: 16.0),),
//                         onPressed: () => Navigator.of(context).pop(), // Close the dialog
//                       ),
//                     ),
//                   ),
//                 ),
//
//               ],
//             );
//           },
//         );
//       } else {
//         print("Context not available for showing dialog!"); // Optional logging
//       }
//       return; // No further execution after dialog dismissal
//     }else{
//       checkUser();
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _videoController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           if (_videoController.value.isInitialized)
//             Positioned(
//               child: Align(
//                 alignment: Alignment.center,
//                 child: AspectRatio(
//                   aspectRatio: _videoController.value.aspectRatio,
//                   child: VideoPlayer(_videoController),
//                 ),
//               ),
//             ),
//           if (_isSearching)
//             Positioned(
//               left: 0,
//               right: 0,
//               bottom: 100.0,
//               child: Container(
//                 color: Colors.black.withOpacity(0.0),
//                 child: Center(
//                   child: kSpinkitDoubleBounce,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
