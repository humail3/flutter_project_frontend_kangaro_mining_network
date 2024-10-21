import 'package:kngro/screens/authentication_screens/service_provider_registration_screen.dart';
import 'package:kngro/screens/authentication_screens/service_taker_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:kngro/components/rounded_button.dart';
import 'package:kngro/constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "registration_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = ColorTween(begin: Colors.green, end: Colors.yellow)
        .animate(_controller);
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Column(children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset(
                      'images/logo_transparent.png',
                    ),
                  ),
                ),
                const Text(
                  'Wages',
                  style: TextStyle(
                    color: kFirstColor,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ]),
            ]),
            SizedBox(
              height: 100.0,
            ),
            RoundedButton('Service Taker', kSecondColor, () {
              Navigator.pushNamed(context, ServiceTakerRegistrationScreen.id);
            }),
            RoundedButton('Service Provider', kFirstColor, () {
              Navigator.pushNamed(
                  context, ServiceProviderRegistrationScreen.id);
            }),
          ],
        ),
      ),
    );
  }
}
