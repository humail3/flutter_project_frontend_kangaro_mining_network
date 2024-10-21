import 'dart:async';
import 'dart:io';
// import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class LabourPrefs {
  String? _email;
  String? _name;
  String? _currentLocation;
  String? _expertiseDescription;
  bool? _premiumUser;
  double? _distance;
  String? _phoneNo;

  Future<void> setLabourDataAtPrefs({
    String? email,
    String? name,
    String? currentLocation,
    String? expertiseDescription,
    bool? premiumUser,
    double? distance,
    String? phoneNo,
  }) async {
    if (email != null) {
      _email = email;
    }
    if (name != null) {
      _name = name;
    }
    if (currentLocation != null) {
      _currentLocation = currentLocation;
    }
    if (expertiseDescription != null) {
      _expertiseDescription = expertiseDescription;
    }
    if (premiumUser != null) {
      _premiumUser = premiumUser;
    }
    if (distance != null) {
      _distance = distance;
    }
    if (phoneNo != null) {
      _phoneNo = phoneNo;
    }
    if (phoneNo != null) {
      _phoneNo = phoneNo;
    }

    await saveLabourDataAtPrefs();
  }

  Future<void> saveLabourDataAtPrefs() async {
    final SharedPreferences labourPrefs = await SharedPreferences.getInstance();
    if (_email != null) {
      await labourPrefs.setString('emailLabour', _email!);
    }
    if (_name != null) {
      await labourPrefs.setString('nameLabour', _name!);
    }
    if (_currentLocation != null) {
      await labourPrefs.setString('currentLocationLabour', _currentLocation!);
    }
    if (_expertiseDescription != null) {
      await labourPrefs.setString(
          'expertiseDescriptionLabour', _expertiseDescription!);
    }
    if (_premiumUser != null) {
      await labourPrefs.setBool('premiumUserLabour', _premiumUser!);
    }
    if (_distance != null) {
      await labourPrefs.setDouble('distanceLabour', _distance!);
    }
    if (_phoneNo != null) {
      await labourPrefs.setString('phoneNoLabour', _phoneNo!);
    }
  }

  Future<void> getLabourDataFromPrefs() async {
    SharedPreferences labourPrefs = await SharedPreferences.getInstance();

    _email = labourPrefs.getString('emailLabour')!;
    _name = labourPrefs.getString('nameLabour')!;
    _currentLocation = labourPrefs.getString('currentLocationLabour')!;
    if (labourPrefs.getString('expertiseDescriptionLabour') != null) {
      _expertiseDescription = labourPrefs.getString('expertiseDescriptionLabour')!;
    }
    _premiumUser = labourPrefs.getBool('premiumUserLabour')!;
    _distance = labourPrefs.getDouble('distanceLabour')!;
    _phoneNo = labourPrefs.getString('phoneNoLabour')!;
  }

  double? get distance => _distance;

  bool? get premiumUser => _premiumUser;

  String? get expertiseDescription => _expertiseDescription;

  String? get currentLocation => _currentLocation;

  String? get name => _name;

  String? get email => _email;

  String? get phoneNo => _phoneNo;

// Future<void> clearAllLabourDataAtPrefs() async {
//   final SharedPreferences labourPrefs =
//   await SharedPreferences.getInstance();
//
//   await labourPrefs.clear();
// }

// Future<void> removeAllLabourDataAtPrefs() async {
//   final SharedPreferences labourPrefs =
//   await SharedPreferences.getInstance();
//
//   await labourPrefs.remove('email');
//   await labourPrefs.remove('name');
//   await labourPrefs.remove('field');
//   await labourPrefs.remove('address');
//   await labourPrefs.remove('current location');
//   await labourPrefs.remove('phone no');
//   await labourPrefs.remove('expertise description');
//   await labourPrefs.remove('latitude');
//   await labourPrefs.remove('longitude');
//   await labourPrefs.remove('profileImageUrl');
//   // others
//   await labourPrefs.remove('service');
//   await labourPrefs.remove('premium user');
// }

// Future<void> updateLabourDataAtPrefs({
//   String? username,
//   String? email,
//   String? name,
//   String? field,
//   String? address,
//   String? currentLocation,
//   String? phoneNo,
//   String? expertiseDescription,
//   double? lati,
//   double? longi,
//   File? image,
//   String? imageUrl,
//   String? service,
//   bool? premiumUser,
// }) async {
//   final SharedPreferences userDataPrefs =
//   await SharedPreferences.getInstance();
//
//   if (username != null) {
//     await userDataPrefs.setString('username', username);
//   }
//   if (email != null) {
//     await userDataPrefs.setString('email', email);
//   }
//   if (name != null) {
//     await userDataPrefs.setString('name', name);
//   }
//   if (field != null) {
//     await userDataPrefs.setString('field', field);
//   }
//   if (address != null) {
//     await userDataPrefs.setString('address', address);
//   }
//   if (currentLocation != null) {
//     await userDataPrefs.setString('current location', currentLocation);
//   }
//   if (phoneNo != null) {
//     await userDataPrefs.setString('phone no', phoneNo);
//   }
//   if (expertiseDescription != null) {
//     await userDataPrefs.setString(
//         'expertise description', expertiseDescription);
//   }
//   if (lati != null) {
//     await userDataPrefs.setDouble('latitude', lati);
//   }
//   if (longi != null) {
//     await userDataPrefs.setDouble('longitude', longi);
//   }
//   if (imageUrl != null) {
//     await userDataPrefs.setString('profileImageUrl', imageUrl);
//   }
//   if (service != null) {
//     await userDataPrefs.setString('service', service);
//   }
//   if (premiumUser != null) {
//     await userDataPrefs.setBool('premium user', premiumUser);
//   }
// }
}
