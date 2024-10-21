import 'package:kngro/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  static const String id = 'support_screen';

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFourthColor,
      appBar: AppBar(
        title: Text('Support',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FAQ Section
            Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,color: kTextBlackColor),
            ),
            SizedBox(height: 16.0),
            _buildFaqItem(
              'How do I register as a service provider?',
              'To register as a service provider, navigate to the registration page and fill out the required information.',
            ),
            _buildFaqItem(
              'How do I create and manage my service listings?',
              'You can create and manage your service listings from the "Manage Services" section in your profile settings.',
            ),
            _buildFaqItem(
              'How does the payment system work for service providers?',
              'Payments for services rendered are processed securely through our app. You can manage your payment preferences in the payment settings.',
            ),
            SizedBox(height: 32.0),

            // Contact Form Section
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,color: kTextBlackColor),
            ),
            SizedBox(height: 16.0),
            _buildContactForm(),
            SizedBox(height: 32.0),

            // Support Articles Section
            Text(
              'Support Articles',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,color: kTextBlackColor),
            ),
            SizedBox(height: 16.0),
            _buildSupportArticleItem(
              'How to effectively manage customer inquiries?',
              'Efficiently managing customer inquiries is crucial for maintaining customer satisfaction and business success. Here are some tips: \n'
                  '→ Prompt Responses:\n Respond to inquiries promptly to show customers that their concerns are valued. Set a standard response time and adhere to it consistently.\n'
                  '→ Clear Communication:\n Clearly communicate information such as service details, pricing, and availability to avoid misunderstandings.\n'
                  '→ Personalization:\n Personalize responses based on the customer\'s inquiry to demonstrate attentiveness and understanding.\n'
                  '→ FAQ Documentation:\n Develop and maintain a comprehensive FAQ section that addresses common inquiries, reducing repetitive questions and providing instant solutions.\n',
            ),
            _buildSupportArticleItem(
              'Tips for improving your service listing visibility',
              'Enhancing the visibility of your service listings is essential for attracting more clients and maximizing business opportunities. Consider implementing the following strategies:\n'
                  '→ Optimized Descriptions: Craft detailed and engaging descriptions that highlight the unique features and benefits of your services.\n'
                  '→ High-Quality Visuals: Include high-quality images and videos that showcase your work or products effectively.\n'
                  '→ SEO Optimization: Optimize your service listings for search engines by using relevant keywords in titles, descriptions, and tags.\n'
                  '→ Promotions and Discounts: Offer promotions or discounts periodically to attract new clients and encourage repeat business.\n'
                  '→ Client Testimonials: Showcase positive client testimonials and reviews to build trust and credibility among potential customers.',
            ),
            _buildSupportArticleItem(
              'Handling disputes and conflicts with clients',
              'Resolving disputes and conflicts with clients professionally is crucial for maintaining positive relationships and protecting your reputation. Consider the following steps:\n'
                  '→ Listen Actively: Listen carefully to the client\'s concerns without interruptions or assumptions. Show empathy and validate their feelings.\n'
                  '→ Clarify the Issue: Clarify the details of the dispute to ensure mutual understanding of the problem and its impact.\n'
                  '→ Propose Solutions: Offer potential solutions or compromises that address the client\'s concerns while aligning with your business policies.\n'
                  '→ Document Agreements: Document any agreements or resolutions in writing to avoid misunderstandings and provide a reference for future interactions.\n'
                  '→ Learn and Improve: Reflect on the dispute resolution process to identify areas for improvement and implement preventive measures for future conflicts.',
            ),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return ExpansionTile(
      iconColor: kTextBlackColor,
      title: Text(question, style: TextStyle(fontWeight: FontWeight.bold,color: kTextBlackColor)),
      children: [Padding(padding: EdgeInsets.all(8.0), child: Text(answer,style: TextStyle(color: kTextBlackColor)),)],
    );
  }

  Widget _buildContactForm() {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    // final TextEditingController _emailController = TextEditingController();
    final TextEditingController _messageController = TextEditingController();

    Future<void> _submitForm() async {
      if (_formKey.currentState!.validate()) {
        final Email email = Email(
          body: _messageController.text,
          subject: 'E-Wages Support',
          recipients: ['humail181153@gmail.com'],
          // cc: ['cc@example.com'],
          // bcc: ['bcc@example.com'],
        );

        try {
          await FlutterEmailSender.send(email);
          // _emailController.clear();
          _messageController.clear();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Your message has been sent!')),
          );
        } catch (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to send email. Please try again later.')),
          );
          print('Error sending email: $error');
        }
      }
    }
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TextFormField(
          //   keyboardType: TextInputType.emailAddress,
          //   style: TextStyle(color: Colors.white),
          //   controller: _emailController,
          //   decoration: InputDecoration(
          //     labelText: 'Email',
          //     border: OutlineInputBorder(),
          //   ),
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return 'Please enter your email';
          //     }
          //     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          //       return 'Please enter a valid email address';
          //     }
          //     return null;
          //   },
          // ),
          SizedBox(height: 16.0),
          TextFormField(
            cursorColor: kFirstColor,
            style: TextStyle(color: kTextBlackColor),
            controller: _messageController,
            decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your message here...'),
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: kFirstColor
            ),
            onPressed: _submitForm,
            child: Text('Submit',style: TextStyle(color: kTextBlackColor,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportArticleItem(String title, String description) {
    return Card(
      color: kSecondColor,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        iconColor: kTextBlackColor,
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold,color: kTextBlackColor)),
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 16.0,color: kTextBlackColor),
            ),
          ),
        ],
      ),
    );
  }
}
