import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kngro/constants.dart';
import 'package:kngro/database/shared_preferences/user_data_shared_preferences.dart';
import 'package:flutter/material.dart';

class ShareFeedbackScreen extends StatefulWidget {
  const ShareFeedbackScreen({super.key});

  static const String id = 'share_feedback_screen';

  @override
  State<ShareFeedbackScreen> createState() => _ShareFeedbackScreenState();
}

class _ShareFeedbackScreenState extends State<ShareFeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  double _rating = 5.0;
  final TextEditingController _feedbackController = TextEditingController();
  UserDataSharedPreferences _userDataSharedPreferences =
      UserDataSharedPreferences();
  String _email = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSharedPrefs();
  }

  Future<void> _loadSharedPrefs() async {
    await _userDataSharedPreferences.getUserDataFromPrefs();
    _email = _userDataSharedPreferences.email!;
  }

  Future<void> _submitFeedback() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('feedback').add({
          'rating': _rating,
          'feedback': _feedbackController.text,
          'timestamp': FieldValue.serverTimestamp(),
          'email': await _userDataSharedPreferences.email,
          // replace this with actual email from shared preferences
        });

        _showSnackBar('Thank you for your feedback!');
        // Clear the form
        _feedbackController.clear();
        setState(() {
          _rating = 5.0;
        });
      } catch (e) {
        _showSnackBar('Failed to submit feedback. Please try again.');
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFourthColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: kTextBlackColor),
        backgroundColor: Colors.white,
        title: Text(
          'Share Feedback',
          style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Rate your experience:',
                style: TextStyle(fontSize: 18.0, color: kTextBlackColor,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Slider(
                activeColor: kFirstColor,
                value: _rating,
                onChanged: (newRating) {
                  setState(() => _rating = newRating);
                },
                divisions: 5,
                min: 1,
                max: 5,
                label: _rating.round().toString(),
              ),
              Text(
                '$_rating Stars',
                style: TextStyle(fontSize: 18.0,color: kTextBlackColor,),
              ),
              SizedBox(height: 16.0),
              Text(
                'Write your feedback:',
                style: TextStyle(fontSize: 18.0, color: kTextBlackColor,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                style: TextStyle(color: kTextBlackColor),
                cursorColor: kFirstColor,
                controller: _feedbackController,
                maxLines: 5,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your feedback here...'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kFirstColor),
                  ),
                  onPressed: _submitFeedback,
                  child: Text('Submit Feedback',style: TextStyle(color: kTextBlackColor,fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
