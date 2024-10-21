import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class EditInfoScreen extends StatefulWidget {
  const EditInfoScreen({super.key});

  static const String id = "edit_info_screen";

  @override
  State<EditInfoScreen> createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends State<EditInfoScreen> {
  Future<void> launchEmail({
    required String recipient,
    required String subject,
    required String body,
  }) async {
    // Construct the Uri object (still useful for error handling)
    final url = Uri.parse('mailto:$recipient?subject=$subject&body=$body');
    // Handle cases where email app cannot be launched
    if (!await launchUrl(url)) {
      // if (Platform.isAndroid) {
      //   // Check for internet permission on Android
      //   final hasPermission = await Permission.internet.status; // Corrected getter name
      //   if (!hasPermission.isGranted) {
      //     await Permission.internet.request();
      //     return; // Exit if permission request is pending
      //   }
      // }

      // Provide user-friendly message based on the platform
      throw 'No email app found or internet permission missing.'; // More descriptive error
    }

    // Launch the email app using the Uri object
    await launchUrl(url);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'For changing you email contact to customer support...',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextButton(
              onPressed: () async {
                try {
                  await launchEmail(
                    recipient: 'humail181153@gmail.com',
                    subject: 'Change Email and Password',
                    body:
                        'I want to change my Email and Password, Please help me, Thanks!',
                  );
                } catch (e) {
                  _showSnackBar(
                      'Something went wrong in opening your mobile phone Gmail App');
                  print(e); // Log the error for debugging
                }
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow),
              ),
              child: Text(
                textAlign: TextAlign.center,
                'Contact Us',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
          ],
        ),
      ),
    );
  }
}
