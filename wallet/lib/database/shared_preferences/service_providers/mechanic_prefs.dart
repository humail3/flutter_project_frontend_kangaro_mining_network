import 'dart:async';
import 'dart:io';
// import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class MechanicPrefs {
  String? _email;
  String? _name;
  String? _currentLocation;
  String? _expertiseDescription;
  bool? _premiumUser;
  double? _distance;
  String? _phoneNo;

  Future<void> setMechanicDataAtPrefs({
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
    await saveMechanicDataAtPrefs();
  }

  Future<void> saveMechanicDataAtPrefs() async {
    final SharedPreferences mechanicPrefs =
        await SharedPreferences.getInstance();
    if (_email != null) {
      await mechanicPrefs.setString('emailMechanic', _email!);
    }
    if (_name != null) {
      await mechanicPrefs.setString('nameMechanic', _name!);
    }
    if (_currentLocation != null) {
      await mechanicPrefs.setString('currentLocationMechanic', _currentLocation!);
    }
    if (_expertiseDescription != null) {
      await mechanicPrefs.setString(
          'expertiseDescriptionMechanic', _expertiseDescription!);
    }
    if (_premiumUser != null) {
      await mechanicPrefs.setBool('premiumUserMechanic', _premiumUser!);
    }
    if (_distance != null) {
      await mechanicPrefs.setDouble('distanceMechanic', _distance!);
    }
    if (_phoneNo != null) {
      await mechanicPrefs.setString('phoneNoMechanic', _phoneNo!);
    }
  }

  Future<void> getMechanicDataFromPrefs() async {
    SharedPreferences mechanicPrefs = await SharedPreferences.getInstance();

    _email = mechanicPrefs.getString('emailMechanic')!;
    _name = mechanicPrefs.getString('nameMechanic')!;
    _currentLocation = mechanicPrefs.getString('currentLocationMechanic')!;
    if (mechanicPrefs.getString('expertiseDescriptionMechanic') != null) {
      _expertiseDescription = mechanicPrefs.getString('expertiseDescriptionMechanic')!;
    }
    _premiumUser = mechanicPrefs.getBool('premiumUserMechanic')!;
    _distance = mechanicPrefs.getDouble('distanceMechanic')!;
    _phoneNo = mechanicPrefs.getString('phoneNoMechanic')!;
  }

  double? get distance => _distance;

  bool? get premiumUser => _premiumUser;

  String? get expertiseDescription => _expertiseDescription;

  String? get currentLocation => _currentLocation;

  String? get name => _name;

  String? get email => _email;

  String? get phoneNo => _phoneNo;

// Future<void> clearAllMechanicDataAtPrefs() async {
//   final SharedPreferences mechanicPrefs =
//   await SharedPreferences.getInstance();
//
//   await mechanicPrefs.clear();
// }

// Future<void> removeAllMechanicDataAtPrefs() async {
//   final SharedPreferences mechanicPrefs =
//   await SharedPreferences.getInstance();
//
//   await mechanicPrefs.remove('email');
//   await mechanicPrefs.remove('name');
//   await mechanicPrefs.remove('field');
//   await mechanicPrefs.remove('address');
//   await mechanicPrefs.remove('current location');
//   await mechanicPrefs.remove('phone no');
//   await mechanicPrefs.remove('expertise description');
//   await mechanicPrefs.remove('latitude');
//   await mechanicPrefs.remove('longitude');
//   await mechanicPrefs.remove('profileImageUrl');
//   // others
//   await mechanicPrefs.remove('service');
//   await mechanicPrefs.remove('premium user');
// }

// Future<void> updateMechanicDataAtPrefs({
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
