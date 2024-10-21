import 'package:kngro/constants.dart';
import 'package:kngro/screens/authentication_screens/login_screen.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  static const String id = "forget_password_screen";

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change to your desired background color
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Image.asset(
              'images/logo.png', // Provide the path to your logo image
              width: 100,
              height: 100,
            ),
            SizedBox(height: 42),
            Text(
              'Forget Password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Change to your desired text color
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Don't worry we are here",
              style: TextStyle(
                fontSize: 16,
                color: kTextBlackColor, // Change to your desired text color
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.blue),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                // Change to your desired button color
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Text('Click here to Recover'),
              ),
            ),
            SizedBox(height: 72),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                // Change to your desired button color
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                child: Text('Log in'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
