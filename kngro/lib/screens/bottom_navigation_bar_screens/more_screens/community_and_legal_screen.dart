import 'package:kngro/constants.dart';
import 'package:flutter/material.dart';

class CommunityAndLegalScreen extends StatefulWidget {
  const CommunityAndLegalScreen({super.key});

  static const String id = 'community_and_legal_screen';

  @override
  State<CommunityAndLegalScreen> createState() =>
      _CommunityAndLegalScreenState();
}

class _CommunityAndLegalScreenState extends State<CommunityAndLegalScreen> {
  final List<Map<String, dynamic>> _supportTopics = [
    {
      'title': 'Account Issues',
      'description': 'Help with account settings, password reset, and more.',
      'details':
          'If you are experiencing issues with your account, such as trouble logging in, resetting your password, or updating your account information, please refer to our detailed guides and FAQs. Our support team is also available to assist you with any account-related problems you may encounter.',
      'icon': Icons.account_circle,
    },
    {
      'title': 'Payments and Invoices',
      'description': 'Questions about payments, invoices, and refunds.',
      'details':
          'For any questions regarding payments, invoices, or refunds, please refer to our payment policies and procedures. We provide step-by-step guides on how to process payments, view invoices, and request refunds. If you need further assistance, our support team is ready to help.',
      'icon': Icons.payment,
    },
    {
      'title': 'Service Guidelines',
      'description':
          'Learn about our community guidelines and service standards.',
      'details':
          'Our community guidelines and service standards ensure that all interactions on ewages are respectful and professional. Please read our guidelines to understand the expectations for service providers and customers. Adhering to these guidelines helps maintain a positive and productive environment for everyone.',
      'icon': Icons.rule,
    },
    {
      'title': 'Legal Information',
      'description': 'Read our terms of service, privacy policy, and more.',
      'details':
          'It is important to be aware of our legal policies, including the terms of service and privacy policy. These documents outline your rights and responsibilities when using the ewages app. We encourage all users to read these policies to stay informed about how we handle your data and ensure compliance with applicable laws.',
      'icon': Icons.gavel,
    },
    {
      'title': 'Technical Support',
      'description': 'Get help with technical issues and troubleshooting.',
      'details':
          'If you are experiencing technical issues with the ewages app, our technical support team is here to help. We offer troubleshooting guides and tips for common problems, as well as direct support for more complex issues. Don’t hesitate to reach out for assistance to ensure a smooth and efficient experience with our app.',
      'icon': Icons.support,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFourthColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: kTextBlackColor),
        backgroundColor: Colors.white,
        title: Text(
          'Community and Legal',
          style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: _supportTopics.length,
        itemBuilder: (context, index) {
          final topic = _supportTopics[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ExpansionTile(
              leading: Icon(topic['icon'], color: Colors.blue),
              title: Text(topic['title']),
              subtitle: Text(topic['description']),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    topic['details'],
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
