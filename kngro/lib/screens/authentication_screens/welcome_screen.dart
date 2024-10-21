import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kngro/constants.dart';
import '../../components/button.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animation =
        ColorTween(begin: kFirstColor, end: kBgWhiteColor).animate(_controller);
    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
      body: SafeArea(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Container(
                width: double.infinity,
                child: Image.asset(
                  'images/logo_nobg_crop.png',
                  width: 300.0,
                  height: 300.0,
                )),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Column(
              children: [
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
                SizedBox(
                  height: 24.0,
                ),
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
                              SizedBox(
                                height: 8.0,
                              ),
                              Center(
                                child: Text(
                                    'Please either login or sign_up to continue',
                                    style: TextStyle(
                                      color: kTextWhiteColor,
                                      fontSize: 16.0,
                                    )),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Button(
                              //       title: 'Login With Email Address',
                              //       textColour: kFirstColor,
                              //       bgColour: kBgWhiteColor,
                              //       icon: Icons.email_outlined,
                              //       iconColour: kFirstColor,
                              //       iconSize: 32.0,
                              //       function: () {
                              //         Navigator.pushNamed(
                              //             context, LoginScreen.id);
                              //       }),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Button(
                                  title: 'Login With Google',
                                  textColour: Colors.redAccent,
                                  bgColour: kBgWhiteColor,
                                  icon: EvaIcons.google,
                                  iconColour: Colors.redAccent,
                                  iconSize: 32.0,
                                  function: () {},
                                ),
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(vertical: 8.0),
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Padding(
                              //         padding: const EdgeInsets.symmetric(
                              //             horizontal: 8.0),
                              //         child: Button(
                              //             title: 'Facebook',
                              //             textColour:
                              //                 CupertinoColors.activeBlue,
                              //             bgColour: kBgWhiteColor,
                              //             icon: Icons.facebook_outlined,
                              //             iconColour:
                              //                 CupertinoColors.activeBlue,
                              //             iconSize: 32.0,
                              //             function: () {
                              //               Navigator.pushNamed(
                              //                   context, LoginScreen.id);
                              //             }),
                              //       ),
                              //       Padding(
                              //         padding: const EdgeInsets.only(
                              //             left: 8.0, right: 8.0),
                              //         child: Button(
                              //             title: 'Google',
                              //             textColour: Colors.redAccent,
                              //             bgColour: kBgWhiteColor,
                              //             icon: EvaIcons.google,
                              //             iconColour: Colors.redAccent,
                              //             iconSize: 32.0,
                              //             function: () {
                              //               Navigator.pushNamed(
                              //                   context, LoginScreen.id);
                              //             }),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Center(
                                child: Text(
                                  'By login in, you agree to the Terms & Conditions\n and Privacy Policy of the app',
                                  style: TextStyle(
                                    color: kTextBlackColor,
                                    fontSize: 12.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ]),
      ),
    );
  }
}
