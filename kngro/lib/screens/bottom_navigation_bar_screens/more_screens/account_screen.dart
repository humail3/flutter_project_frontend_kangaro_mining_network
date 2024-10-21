import 'package:kngro/components/rectangle_box_text.dart';
import 'package:kngro/components/rectangle_button.dart';
import 'package:kngro/database/shared_preferences/login_shared_preferences.dart';
import 'package:kngro/database/shared_preferences/user_data_shared_preferences.dart';
import 'package:kngro/screens/authentication_screens/welcome_screen.dart';
// import 'package:kngro/screens/bottom_navigation_bar_screens/profile_screens/account_screens/deactivation_and_deletion_screen.dart';
// import 'package:kngro/screens/bottom_navigation_bar_screens/profile_screens/account_screens/edit_info_screen.dart';
// import 'package:kngro/screens/bottom_navigation_bar_screens/profile_screens/account_screens/privacy_screen.dart';
import 'package:flutter/material.dart';

import 'account_screens/deactivation_and_deletion_screen.dart';
import 'account_screens/edit_info_screen.dart';
import 'account_screens/privacy_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  static const String id = 'account_screen';

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  LoginSharedPreferences loginSharedPreferences = LoginSharedPreferences();
  UserDataSharedPreferences userDataSharedPreferences = UserDataSharedPreferences();
  String _name = '';
  String _email = '';


  Future<void> _loadSharedPreferences() async {
    await userDataSharedPreferences
        .getUserDataFromPrefs();

    setState(() {
      _name = userDataSharedPreferences.name!;
      _email = userDataSharedPreferences.email!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20.0),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.amberAccent,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32.0, bottom: 14.0, left: 16.0),
            child: Text(
              'Account info',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          RectangleBoxText(title: 'Full name', displayText: _name),
          RectangleBoxText(
              title: 'Email', displayText: _email),
          RectangleButton(
            title: 'Edit info',
            rightIcon: Icons.keyboard_arrow_right_outlined,
            textStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            function: (){
              Navigator.pushNamed(context, EditInfoScreen.id);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.0, bottom: 14.0, left: 16.0),
            child: Text(
              'Account management',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          RectangleButton(
            title: 'Deactivation and deletion',
            rightIcon: Icons.keyboard_arrow_right_outlined,
            textStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            bottomSizedBoxHeight: 1.0,
          function: (){
              Navigator.pushNamed(context, DeactivationAndDeletionScreen.id);
          },
          ),
          RectangleButton(
            title: 'Privacy',
            rightIcon: Icons.keyboard_arrow_right_outlined,
            textStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            function: (){
              Navigator.pushNamed(context, PrivacyScreen.id);
            },
          ),
          SizedBox(height: 16.0),
          RectangleButton(
            title: 'Logout',
            function: (){
              loginSharedPreferences.
              setUserLoginAtSharedPreferences(false);
              Navigator.popUntil(context, (route) => route.isFirst);
              // Navigator.pushReplacementNamed(context, WelcomeScreen.id);
            },
            rightIcon: Icons.keyboard_arrow_right_outlined,
            leftIcon: Icons.logout_outlined,
            leftIconColour: Colors.redAccent,
            textStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.redAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 50.0,),
        ],
      ),
    );
  }
}
