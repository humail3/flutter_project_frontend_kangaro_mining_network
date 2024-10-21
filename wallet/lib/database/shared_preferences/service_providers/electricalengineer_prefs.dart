import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class ElectricalEngineerPrefs {

  String? _email;
  String? _name;
  String? _currentLocation;
  String? _expertiseDescription;
  bool? _premiumUser;
  double? _distance;
  String? _phoneNo;


  Future<void> setElectricalEngineerDataAtPrefs({
    String? email,
    String? name,
    String? currentLocation,
    String? expertiseDescription,
    bool? premiumUser,
    double? distance,String? phoneNo,
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
    }if (phoneNo != null) {
      _phoneNo = phoneNo;
    }
    await saveElectricalEngineerDataAtPrefs();
  }

  Future<void> saveElectricalEngineerDataAtPrefs() async {
    final SharedPreferences electricalEngineerPrefs =
    await SharedPreferences.getInstance();
    if (_email != null) {
      await electricalEngineerPrefs.setString('emailElectricalEngineer', _email!);
    }
    if (_name != null) {
      await electricalEngineerPrefs.setString('nameElectricalEngineer', _name!);
    }
    if (_currentLocation != null) {
      await electricalEngineerPrefs.setString('currentLocationElectricalEngineer', _currentLocation!);
    }
    if (_expertiseDescription != null) {
      await electricalEngineerPrefs.setString(
          'expertiseDescriptionElectricalEngineer', _expertiseDescription!);
    }
    if (_premiumUser != null) {
      await electricalEngineerPrefs.setBool('premiumUserElectricalEngineer', _premiumUser!);
    }
    if (_distance != null) {
      await electricalEngineerPrefs.setDouble('distanceElectricalEngineer', _distance!);
    } if (_phoneNo != null) {
      await electricalEngineerPrefs.setString('phoneNoElectricalEngineer', _phoneNo!);
    }
  }

  Future<void> getElectricalEngineerDataFromPrefs() async {
    SharedPreferences electricalEngineerPrefs = await SharedPreferences.getInstance();

    _email = electricalEngineerPrefs.getString('emailElectricalEngineer')!;
    _name = electricalEngineerPrefs.getString('nameElectricalEngineer')!;
    _currentLocation = electricalEngineerPrefs.getString('currentLocationElectricalEngineer')!;
    if (electricalEngineerPrefs.getString('expertiseDescriptionElectricalEngineer') != null) {
      _expertiseDescription = electricalEngineerPrefs.getString('expertiseDescriptionElectricalEngineer')!;
    }
    _premiumUser = electricalEngineerPrefs.getBool('premiumUserElectricalEngineer')!;
    _distance = electricalEngineerPrefs.getDouble('distanceElectricalEngineer')!;
    if (electricalEngineerPrefs.getString('phoneNoElectricalEngineer') != null) {
      _phoneNo = electricalEngineerPrefs.getString('phoneNoElectricalEngineer')!;
    }
  }

  double? get distance => _distance;

  bool? get premiumUser => _premiumUser;

  String? get expertiseDescription => _expertiseDescription;

  String? get currentLocation => _currentLocation;

  String? get name => _name;

  String? get email => _email;

  String? get phoneNo => _phoneNo;


// Future<void> clearAllElectricalEngineerDataAtPrefs() async {
//   final SharedPreferences electricalEngineerPrefs =
//   await SharedPreferences.getInstance();
//
//   await electricalEngineerPrefs.clear();
// }

// Future<void> removeAllElectricalEngineerDataAtPrefs() async {
//   final SharedPreferences electricalEngineerPrefs =
//   await SharedPreferences.getInstance();
//
//   await electricalEngineerPrefs.remove('email');
//   await electricalEngineerPrefs.remove('name');
//   await electricalEngineerPrefs.remove('field');
//   await electricalEngineerPrefs.remove('address');
//   await electricalEngineerPrefs.remove('current location');
//   await electricalEngineerPrefs.remove('phone no');
//   await electricalEngineerPrefs.remove('expertise description');
//   await electricalEngineerPrefs.remove('latitude');
//   await electricalEngineerPrefs.remove('longitude');
//   await electricalEngineerPrefs.remove('profileImageUrl');
//   // others
//   await electricalEngineerPrefs.remove('service');
//   await electricalEngineerPrefs.remove('premium user');
// }

// Future<void> updateElectricalEngineerDataAtPrefs({
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
