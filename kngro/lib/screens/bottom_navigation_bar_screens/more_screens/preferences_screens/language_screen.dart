import 'package:kngro/constants.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  static const String id = 'language_screen';

  // final void Function(Locale locale) onLocaleChange;

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  // late SharedPreferences _prefs;
  // late Locale _selectedLocale;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _loadLanguage();
  // }
  //
  // void _loadLanguage() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   String? languageCode = _prefs.getString('language_code');
  //   if (languageCode != null) {
  //     _selectedLocale = Locale(languageCode);
  //   } else {
  //     _selectedLocale = Locale('en'); // Default to English
  //   }
  //   widget.onLocaleChange(_selectedLocale);
  // }

  // void _changeLanguage(Locale locale) {
  //   setState(() {
  //     _selectedLocale = locale;
  //     widget.onLocaleChange(locale);
  //     _prefs.setString('language_code', locale.languageCode);
  //   });
  // }

  // Widget _buildLanguageOption(String language, Locale locale) {
  //   return
      // RadioListTile<Locale>(
      // title: Text(language,style: TextStyle(color: Colors.black),),
      // value: locale,
      // activeColor: Colors.blueAccent,
      // groupValue: _selectedLocale,
      // onChanged: (Locale? value) {
      //   if (value != null) {
      //     _changeLanguage(value);
        // }
      // },
    // );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: kTextBlackColor),
        backgroundColor: Colors.white,
        title: Text('Language',style: TextStyle(fontWeight: FontWeight.bold,color: kTextBlackColor),),
        // title: Text(S.of(context).title),
      ),
      body: Padding(
          padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 16.0),
            // _buildLanguageOption('English', Locale('en')),
            // _buildLanguageOption('Urdu', Locale('ur')),
            SizedBox(height: 0.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'English',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                Icon(Icons.radio_button_checked_outlined,color: kTextBlackColor,size: 20.0,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
