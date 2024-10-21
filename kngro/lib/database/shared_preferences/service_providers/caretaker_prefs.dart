import 'dart:async';
import 'dart:io';
// import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class CareTakerPrefs {
  String? _email;
  String? _name;
  String? _currentLocation;
  String? _expertiseDescription;
  bool? _premiumUser;
  double? _distance;
  String? _phoneNo;

  Future<void> setCareTakerDataAtPrefs({
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

    await saveCareTakerDataAtPrefs();
  }

  Future<void> saveCareTakerDataAtPrefs() async {
    final SharedPreferences careTakerPrefs =
        await SharedPreferences.getInstance();
    if (_email != null) {
      await careTakerPrefs.setString('emailCareTaker', _email!);
    }
    if (_name != null) {
      await careTakerPrefs.setString('nameCareTaker', _name!);
    }
    if (_currentLocation != null) {
      await careTakerPrefs.setString('currentLocationCareTaker', _currentLocation!);
    }
    if (_expertiseDescription != null) {
      await careTakerPrefs.setString(
          'expertiseDescriptionCareTaker', _expertiseDescription!);
    }
    if (_premiumUser != null) {
      await careTakerPrefs.setBool('premiumUserCareTaker', _premiumUser!);
    }
    if (_distance != null) {
      await careTakerPrefs.setDouble('distanceCareTaker', _distance!);
    }
    if (_phoneNo != null) {
      await careTakerPrefs.setString('phoneNoCareTaker', _phoneNo!);
    }
  }

  Future<void> getCareTakerDataFromPrefs() async {
    SharedPreferences careTakerPrefs = await SharedPreferences.getInstance();

    _email = careTakerPrefs.getString('emailCareTaker')!;
    _name = careTakerPrefs.getString('nameCareTaker')!;
    _currentLocation = careTakerPrefs.getString('currentLocationCareTaker')!;
    if (careTakerPrefs.getString('expertiseDescriptionCareTaker') != null) {
      _expertiseDescription =
          careTakerPrefs.getString('expertiseDescriptionCareTaker')!;
    }
    _premiumUser = careTakerPrefs.getBool('premiumUserCareTaker')!;
    _distance = careTakerPrefs.getDouble('distanceCareTaker')!;
    _phoneNo = careTakerPrefs.getString('phoneNoCareTaker')!;
  }

  double? get distance => _distance;

  bool? get premiumUser => _premiumUser;

  String? get expertiseDescription => _expertiseDescription;

  String? get currentLocation => _currentLocation;

  String? get name => _name;

  String? get email => _email;

  String? get phoneNo => _phoneNo;

// Future<void> clearAllCareTakerDataAtPrefs() async {
//   final SharedPreferences careTakerPrefs =
//   await SharedPreferences.getInstance();
//
//   await careTakerPrefs.clear();
// }

// Future<void> removeAllCareTakerDataAtPrefs() async {
//   final SharedPreferences careTakerPrefs =
//   await SharedPreferences.getInstance();
//
//   await careTakerPrefs.remove('email');
//   await careTakerPrefs.remove('name');
//   await careTakerPrefs.remove('field');
//   await careTakerPrefs.remove('address');
//   await careTakerPrefs.remove('current location');
//   await careTakerPrefs.remove('phone no');
//   await careTakerPrefs.remove('expertise description');
//   await careTakerPrefs.remove('latitude');
//   await careTakerPrefs.remove('longitude');
//   await careTakerPrefs.remove('profileImageUrl');
//   // others
//   await careTakerPrefs.remove('service');
//   await careTakerPrefs.remove('premium user');
// }

// Future<void> updateCareTakerDataAtPrefs({
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
