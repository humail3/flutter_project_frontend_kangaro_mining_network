import 'package:kngro/components/rectangle_button.dart';
// import 'package:kngro/screens/bottom_navigation_bar_screens/profile_screens/account_screens/edit_info_screen.dart';
// import 'package:kngro/screens/bottom_navigation_bar_screens/profile_screens/preferences_screens/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:kngro/constants.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/more_screens/preferences_screens/language_screen.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  static const String id = 'preferences_screen';

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  // UserDataSharedPreferences userDataSharedPreferences = UserDataSharedPreferences();
  // String _language = '';


  // Future<void> _loadSharedPreferences() async {
  //   await userDataSharedPreferences
  //       .getUserDataFromPrefs();
  //
  //   setState(() {
  //     _language = userDataSharedPreferences.name!;
  //   });
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _loadSharedPreferences();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Preferences',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20.0),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: kSecondColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32.0, bottom: 14.0, left: 16.0),
            child: Text(
              'App Preferences',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView(children: [
              SizedBox(height: 16.0),
              RectangleButton(
                title: 'Language',
                rightIcon: Icons.keyboard_arrow_right_outlined,
                textStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                function: (){
                  Navigator.pushNamed(context, LanguageScreen.id);
                },
              ),
              SizedBox(height: 48.0),
            ]),
          ),
        ],
      ),
    );
  }
}
