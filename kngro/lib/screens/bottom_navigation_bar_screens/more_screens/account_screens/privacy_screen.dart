import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  static const String id = 'privacy_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'eWages Privacy Policy',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Welcome to eWages Privacy Policy page! When you use our app, we collect and store your information. This policy explains how we collect, use, disclose, and safeguard your information. Please read this privacy policy carefully. If you do not agree with the terms of this policy, please do not access the app.',
              style: TextStyle(fontSize: 16.0,                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Information We Collect',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,                color: Colors.black,

              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'We may collect personal information from you such as your name, email address, phone number, location, etc. This information is used to provide you with our services and improve your experience.',
              style: TextStyle(fontSize: 16.0,                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'How We Use Your Information',
              style: TextStyle(
                fontSize: 20.0,                color: Colors.black,

                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'We use your information to personalize your experience, communicate with you, improve our services, and comply with legal obligations.',
              style: TextStyle(fontSize: 16.0,                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Sharing Your Information',
              style: TextStyle(
                fontSize: 20.0,                color: Colors.black,

                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'We may share your information with third parties only as described in this privacy policy or with your consent. We do not sell your personal information to third parties.',
              style: TextStyle(fontSize: 16.0,                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Security of Your Information',
              style: TextStyle(
                fontSize: 20.0,                color: Colors.black,

                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'We take reasonable measures to protect your information from unauthorized access, use, or disclosure. However, no method of transmission over the internet or electronic storage is 100% secure.',
              style: TextStyle(fontSize: 16.0,                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Changes to This Privacy Policy',
              style: TextStyle(                color: Colors.black,

                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'We may update this privacy policy from time to time. We will notify you of any changes by posting the new policy on this page. You are advised to review this policy periodically for any changes.',
              style: TextStyle(fontSize: 16.0,                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
