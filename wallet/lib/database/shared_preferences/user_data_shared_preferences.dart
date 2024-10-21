import 'dart:async';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class UserDataSharedPreferences {
  String? _username;
  String? _email;
  String? _name;
  String? _field;
  String? _address;
  String? _currentLocation;
  String? _phoneNo;
  String? _expertiseDescription;
  double? _lati;
  double? _longi;
  String? _imageUrl;
  String? _service;
  bool? _premiumUser;

  Future<void> setUserDataAtPrefs({
    String? username,
    String? email,
    String? name,
    String? field,
    String? address,
    String? currentLocation,
    String? phoneNo,
    String? expertiseDescription,
    double? lati,
    double? longi,
    String? imageUrl,
    String? service,
    bool? premiumUser,
  }) async {
    if (username != null) {
      _username = username;
    }
    if (email != null) {
      _email = email;
    }
    if (name != null) {
      _name = name;
    }
    if (field != null) {
      _field = field;
    }
    if (address != null) {
      _address = address;
    }
    if (currentLocation != null) {
      _currentLocation = currentLocation;
    }
    if (phoneNo != null) {
      _phoneNo = phoneNo;
    }
    if (expertiseDescription != null) {
      _expertiseDescription = expertiseDescription;
    }
    if (lati != null) {
      _lati = lati;
    }
    if (longi != null) {
      _longi = longi;
    }
    if (imageUrl != null) {
      _imageUrl = imageUrl;
    }
    if (service != null) {
      _service = service;
    }
    if (premiumUser != null) {
      _premiumUser = premiumUser;
    }

    await saveUserDataAtPrefs();
  }

  Future<void> saveUserDataAtPrefs() async {
    final SharedPreferences userDataPrefs =
        await SharedPreferences.getInstance();
    if (_username != null) {
      await userDataPrefs.setString('usernameUser', _username!);
    }

    if (_email != null) {
      await userDataPrefs.setString('emailUser', _email!);
    }
    if (_name != null) {
      await userDataPrefs.setString('nameUser', _name!);
    }
    if (_field != null) {
      await userDataPrefs.setString('fieldUser', _field!);
    }
    if (_address != null) {
      await userDataPrefs.setString('addressUser', _address!);
    }

    if (_currentLocation != null) {
      await userDataPrefs.setString('currentLocationUser', _currentLocation!);
    }
    if (_phoneNo != null) {
      await userDataPrefs.setString('phoneNoUser', _phoneNo!);
    }
    if (_expertiseDescription != null) {
      await userDataPrefs.setString(
          'expertiseDescriptionUser', _expertiseDescription!);
    }
    if (_lati != null) {
      await userDataPrefs.setDouble('latitudeUser', _lati!);
    }

    if (_longi != null) {
      await userDataPrefs.setDouble('longitudeUser', _longi!);
    }

    if (_imageUrl != null) {
      await userDataPrefs.setString('profileImageUrlUser', _imageUrl!);
    }
    if (_service != null) {
      await userDataPrefs.setString('serviceUser', _service!);
    }
    // others

    if (_premiumUser != null) {
      await userDataPrefs.setBool('premiumUserUser', _premiumUser!);
    }
  }

  Future<void> getUserDataFromPrefs() async {
    SharedPreferences userDataPrefs = await SharedPreferences.getInstance();

    _username = userDataPrefs.getString('usernameUser')!;
    _email = userDataPrefs.getString('emailUser')!;
    _name = userDataPrefs.getString('nameUser')!;
    if (userDataPrefs.getString('fieldUser') != null) {
      _field = userDataPrefs.getString('fieldUser');
    }
    _address = userDataPrefs.getString('addressUser')!;
    _currentLocation = userDataPrefs.getString('currentLocationUser')!;
    if (userDataPrefs.getString('phoneNoUser') != null) {
      _phoneNo = userDataPrefs.getString('phoneNoUser')!;
    }
    if (userDataPrefs.getString('expertiseDescriptionUser') != null) {
      _expertiseDescription = userDataPrefs.getString('expertiseDescriptionUser')!;
    }
    _lati = userDataPrefs.getDouble('latitudeUser')!;
    _longi = userDataPrefs.getDouble('longitudeUser')!;
    _imageUrl = userDataPrefs.getString('profileImageUrlUser')!;
    // others
    _service = userDataPrefs.getString('serviceUser')!;
    _premiumUser = userDataPrefs.getBool('premiumUserUser')!;
  }

  Future<void> clearAllUserDataAtPrefs() async {
    final SharedPreferences userDataPrefs =
        await SharedPreferences.getInstance();

    await userDataPrefs.clear();
  }

  Future<void> removeAllUserDataAtPrefs() async {
    final SharedPreferences userDataPrefs =
        await SharedPreferences.getInstance();

    await userDataPrefs.remove('usernameUser');
    await userDataPrefs.remove('emailUser');
    await userDataPrefs.remove('nameUser');
    await userDataPrefs.remove('fieldUser');
    await userDataPrefs.remove('addressUser');
    await userDataPrefs.remove('currentLocationUser');
    await userDataPrefs.remove('phoneNoUser');
    await userDataPrefs.remove('expertiseDescriptionUser');
    await userDataPrefs.remove('latitudeUser');
    await userDataPrefs.remove('longitudeUser');
    await userDataPrefs.remove('profileImageUrlUser');
    // others
    await userDataPrefs.remove('serviceUser');
    await userDataPrefs.remove('premiumUserUser');
  }

  Future<void> updateUserDataAtPrefs({
    String? username,
    String? email,
    String? name,
    String? field,
    String? address,
    String? currentLocation,
    String? phoneNo,
    String? expertiseDescription,
    double? lati,
    double? longi,
    File? image,
    String? imageUrl,
    String? service,
    bool? premiumUser,
  }) async {
    final SharedPreferences userDataPrefs =
        await SharedPreferences.getInstance();

    if (username != null) {
      await userDataPrefs.setString('usernameUser', username);
    }
    if (email != null) {
      await userDataPrefs.setString('emailUser', email);
    }
    if (name != null) {
      await userDataPrefs.setString('nameUser', name);
    }
    if (field != null) {
      await userDataPrefs.setString('fieldUser', field);
    }
    if (address != null) {
      await userDataPrefs.setString('addressUser', address);
    }
    if (currentLocation != null) {
      await userDataPrefs.setString('currentLocationUser', currentLocation);
    }
    if (phoneNo != null) {
      await userDataPrefs.setString('phoneNoUser', phoneNo);
    }
    if (expertiseDescription != null) {
      await userDataPrefs.setString(
          'expertiseDescriptionUser', expertiseDescription);
    }
    if (lati != null) {
      await userDataPrefs.setDouble('latitudeUser', lati);
    }
    if (longi != null) {
      await userDataPrefs.setDouble('longitudeUser', longi);
    }
    if (imageUrl != null) {
      await userDataPrefs.setString('profileImageUrlUser', imageUrl);
    }
    if (service != null) {
      await userDataPrefs.setString('serviceUser', service);
    }
    if (premiumUser != null) {
      await userDataPrefs.setBool('premiumUserUser', premiumUser);
    }
  }

  bool? get premiumUser => _premiumUser;

  String? get service => _service;

  String? get imageUrl => _imageUrl;

  double? get longi => _longi;

  double? get lati => _lati;

  String? get expertiseDescription => _expertiseDescription;

  String? get phoneNo => _phoneNo;

  String? get currentLocation => _currentLocation;

  String? get address => _address;

  String? get field => _field;

  String? get name => _name;

  String? get email => _email;

  String? get username => _username;
}
