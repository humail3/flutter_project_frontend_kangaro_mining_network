import 'dart:async';
import 'dart:io';
// import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class DoctorPrefs {
  String? _email;
  String? _name;
  String? _currentLocation;
  String? _expertiseDescription;
  bool? _premiumUser;
  double? _distance;
  String? _phoneNo;

  Future<void> setDoctorDataAtPrefs({
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

    await saveDoctorDataAtPrefs();
  }

  Future<void> saveDoctorDataAtPrefs() async {
    final SharedPreferences doctorPrefs = await SharedPreferences.getInstance();
    if (_email != null) {
      await doctorPrefs.setString('emailDoctor', _email!);
    }
    if (_name != null) {
      await doctorPrefs.setString('nameDoctor', _name!);
    }
    if (_currentLocation != null) {
      await doctorPrefs.setString('currentLocationDoctor', _currentLocation!);
    }
    if (_expertiseDescription != null) {
      await doctorPrefs.setString(
          'expertiseDescriptionDoctor', _expertiseDescription!);
    }
    if (_premiumUser != null) {
      await doctorPrefs.setBool('premiumUserDoctor', _premiumUser!);
    }
    if (_distance != null) {
      await doctorPrefs.setDouble('distanceDoctor', _distance!);
    }
    if (_phoneNo != null) {
      await doctorPrefs.setString('phoneNoDoctor', _phoneNo!);
    }
  }

  Future<void> getDoctorDataFromPrefs() async {
    SharedPreferences doctorPrefs = await SharedPreferences.getInstance();

    _email = doctorPrefs.getString('emailDoctor')!;
    _name = doctorPrefs.getString('nameDoctor')!;
    _currentLocation = doctorPrefs.getString('currentLocationDoctor')!;
    if (doctorPrefs.getString('expertiseDescriptionDoctor') != null) {
      _expertiseDescription = doctorPrefs.getString('expertiseDescriptionDoctor')!;
    }
    _premiumUser = doctorPrefs.getBool('premiumUserDoctor')!;
    _distance = doctorPrefs.getDouble('distanceDoctor')!;
    _phoneNo = doctorPrefs.getString('phoneNoDoctor')!;
  }

  double? get distance => _distance;

  bool? get premiumUser => _premiumUser;

  String? get expertiseDescription => _expertiseDescription;

  String? get currentLocation => _currentLocation;

  String? get name => _name;

  String? get email => _email;

  String? get phoneNo => _phoneNo;

// Future<void> clearAllDoctorDataAtPrefs() async {
//   final SharedPreferences doctorPrefs =
//   await SharedPreferences.getInstance();
//
//   await doctorPrefs.clear();
// }

// Future<void> removeAllDoctorDataAtPrefs() async {
//   final SharedPreferences doctorPrefs =
//   await SharedPreferences.getInstance();
//
//   await doctorPrefs.remove('email');
//   await doctorPrefs.remove('name');
//   await doctorPrefs.remove('field');
//   await doctorPrefs.remove('address');
//   await doctorPrefs.remove('current location');
//   await doctorPrefs.remove('phone no');
//   await doctorPrefs.remove('expertise description');
//   await doctorPrefs.remove('latitude');
//   await doctorPrefs.remove('longitude');
//   await doctorPrefs.remove('profileImageUrl');
//   // others
//   await doctorPrefs.remove('service');
//   await doctorPrefs.remove('premium user');
// }

// Future<void> updateDoctorDataAtPrefs({
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
