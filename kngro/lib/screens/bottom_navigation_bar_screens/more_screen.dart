import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kngro/constants.dart';
import '../../components/rectangle_button.dart';
import '../../database/local_image/local_image.dart';
import '../../database/shared_preferences/user_data_shared_preferences.dart';
import 'more_screens/account_screen.dart';
import 'more_screens/community_and_legal_screen.dart';
import 'more_screens/preferences_screen.dart';
import 'more_screens/share_feedback_screen.dart';
import 'more_screens/support_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  static const String id = 'more_screen';

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  UserDataSharedPreferences userDataSharedPreferences =
      UserDataSharedPreferences();
  LocalImage profileImageLocaly = LocalImage();
  File? _image;
  String _name = '';
  String _service = '';
  bool _premiumUser = false;
  String _email = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadProfileImage();
    _loadSharedPreferences();
  }

  Future<void> _loadProfileImage() async {
    File? image = await profileImageLocaly.loadImage(imageName: 'userImage');
    setState(() {
      _image = image;
    });
  }

  Future<void> _loadSharedPreferences() async {
    await userDataSharedPreferences.getUserDataFromPrefs();

    setState(() {
      _name = userDataSharedPreferences.name!;
      _service = userDataSharedPreferences.service!;
      _premiumUser = userDataSharedPreferences.premiumUser!;
      _email = userDataSharedPreferences.email!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgWhiteColor,
      body: SafeArea(
        child: Expanded(
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: kTextDecoration2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Container(
                          color: kSecondColor,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: ClipOval(
                              child: _image != null
                                  ? Image.file(
                                      _image!,
                                      width: 70.0,
                                      height: 70.0,
                                      fit: BoxFit.cover,
                                    )
                                  : Icon(
                                      Icons.account_circle,
                                      size: 70.0,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_name,
                              style: TextStyle(
                                  color: kTextBlackColor,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            'Regular User',
                            style: TextStyle(color: kFirstColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.0, bottom: 16.0, left: 16.0),
              child: Text(
                'Features',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
            RectangleButton(
              title: 'News',
              leftIcon: Icons.newspaper_outlined,
              rightIcon: Icons.keyboard_arrow_right_outlined,
              function: () {
                // _service=='Service provider'?Navigator.pushNamed(context, MyProfileServiceProviderScreen.id)
                //     :Navigator.pushNamed(context, MyProfileServiceTakerScreen.id);
              },
            ),
            RectangleButton(
              title: 'Feed',
              leftIcon: Icons.upload_file_outlined,
              rightIcon: Icons.keyboard_arrow_right_outlined,
              function: () {
                // _service=='Service provider'?Navigator.pushNamed(context, ManageServiceProviderAccountScreen.id,arguments:_email)
                //     :Navigator.pushNamed(context, ManageServiceTakerAccountScreen.id,arguments:_email);
              },
            ),
            RectangleButton(
              title: 'Chat',
              leftIcon: Icons.chat_outlined,
              rightIcon: Icons.keyboard_arrow_right_outlined,
              function: () {
                // _service=='Service provider'?Navigator.pushNamed(context, ManageServiceProviderAccountScreen.id,arguments:_email)
                //     :Navigator.pushNamed(context, ManageServiceTakerAccountScreen.id,arguments:_email);
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.0, bottom: 16.0, left: 16.0),
              child: Text(
                'Settings',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
            RectangleButton(
              title: 'Preferences',
              leftIcon: Icons.settings,
              rightIcon: Icons.keyboard_arrow_right_outlined,
              function: () {
                Navigator.pushNamed(context, PreferencesScreen.id);
              },
            ),
            RectangleButton(
              title: 'Account',
              leftIcon: Icons.switch_account,
              rightIcon: Icons.keyboard_arrow_right_outlined,
              function: () {
                Navigator.pushNamed(context, AccountScreen.id);
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.0, bottom: 16.0, left: 16.0),
              child: Text(
                'Resources',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
            RectangleButton(
              title: 'Support',
              leftIcon: Icons.support,
              rightIcon: Icons.keyboard_arrow_right_outlined,
              function: () {
                Navigator.pushNamed(context, SupportScreen.id);
              },
            ),
            RectangleButton(
              title: 'Community and legal',
              leftIcon: Icons.help,
              rightIcon: Icons.keyboard_arrow_right_outlined,
              function: () {
                Navigator.pushNamed(context, CommunityAndLegalScreen.id);
              },
            ),
            RectangleButton(
              title: 'Share feedback',
              leftIcon: Icons.mobile_screen_share_rounded,
              rightIcon: Icons.keyboard_arrow_right_outlined,
              function: () {
                Navigator.pushNamed(context, ShareFeedbackScreen.id);
              },
            ),
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                    child: Text(
                  '1.0',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )))
          ]),
        ),
      ),
    );
  }
}
