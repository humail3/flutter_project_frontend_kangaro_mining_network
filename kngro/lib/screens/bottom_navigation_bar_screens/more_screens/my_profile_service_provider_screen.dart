import 'dart:io';

import 'package:kngro/components/rectangle_box_text.dart';
import 'package:kngro/components/rectangle_button.dart';
import 'package:kngro/constants.dart';
import 'package:kngro/database/local_image/local_image.dart';
import 'package:kngro/database/shared_preferences/user_data_shared_preferences.dart';
// import 'package:kngro/screens/bottom_navigation_bar_screens/profile_screens/account_screens/edit_info_screen.dart';
// import 'package:kngro/screens/bottom_navigation_bar_screens/profile_screens/manage_service_provider_account_screen.dart';
import 'package:flutter/material.dart';

import '../../../components/rectangle_box_text.dart';
import '../../../components/rectangle_button.dart';
import '../../../constants.dart';
import 'manage_service_provider_account_screen.dart';

class MyProfileServiceProviderScreen extends StatefulWidget {
  const MyProfileServiceProviderScreen({super.key});

  static const String id = 'my_profile_service_provider_screen';

  @override
  State<MyProfileServiceProviderScreen> createState() => _MyProfileServiceProviderScreenState();
}

class _MyProfileServiceProviderScreenState extends State<MyProfileServiceProviderScreen> {
  // UserDataSharedPreferences userDataSharedPreferences = UserDataSharedPreferences();
  String _name = '';
  String _field='';
  String _address='';
  String _currentLocation='' ;
  // LocalImage profileImageLocaly = LocalImage();
  File? _image;
  String _phoneNo='';
  String _expertiseDescription='';
  String _service='';
  bool _premiumUser=false;

  Future<void> _loadProfileImage() async {
    // File? image = await profileImageLocaly.loadImage(imageName: 'userImage');
    setState(() {
      // _image = image;
    });
  }

  Future<void> _loadSharedPreferences() async {
    // await userDataSharedPreferences
    //     .getUserDataFromPrefs();

    // setState(() {
    //   _name = userDataSharedPreferences.name!;
    //   _field = userDataSharedPreferences.field!;
    //   _address = userDataSharedPreferences.address!;
    //   _currentLocation = userDataSharedPreferences.currentLocation!;
    //   _phoneNo = userDataSharedPreferences.phoneNo!;
    //   _expertiseDescription = userDataSharedPreferences.expertiseDescription!;
    //   _service = userDataSharedPreferences.service!;
    //   _premiumUser = userDataSharedPreferences.premiumUser!;
    //
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadProfileImage();
    _loadSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20.0),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.amberAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32.0, bottom: 14.0, left: 16.0),
            child: Text(
              'My profile info',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView(children: [
              SizedBox(height: 16.0),
              Center(
                child: DecoratedBox(
                  decoration: kTextDecoration,
                  child: _image == null
                      ? Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Your profile image',
                        style: TextStyle(
                            color: kHintColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ))
                      : Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Image.file(
                      _image!,
                      height: 150.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              RectangleBoxText(title: 'Full name', displayText: _name),
              RectangleBoxText(title: 'Field', displayText: _field),
              RectangleBoxText(title: 'Address', displayText: _address),
              RectangleBoxText(title: 'Current location', displayText:_currentLocation),
              RectangleBoxText(title: 'Phone Number', displayText:_phoneNo),
              RectangleBoxText(title: 'Expertise Description', displayText:_expertiseDescription),
              RectangleBoxText(title: 'Service', displayText:_service),
              RectangleBoxText(title: 'User', displayText:_premiumUser?'Premium User':'Regular User'),
              SizedBox(height: 16.0),
              RectangleButton(
                title: 'Edit info',
                rightIcon: Icons.keyboard_arrow_right_outlined,
                textStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                function: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, ManageServiceProviderAccountScreen.id);
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
