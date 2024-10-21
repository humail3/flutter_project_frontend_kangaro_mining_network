import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PlumberPrefs {
  String? _email;
  String? _name;
  String? _currentLocation;
  String? _expertiseDescription;
  bool? _premiumUser;
  double? _distance;
  String? _phoneNo;

  Future<void> setPlumberDataAtPrefs({
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

    await savePlumberDataAtPrefs();
  }

  Future<void> savePlumberDataAtPrefs() async {
    final SharedPreferences plumberPrefs =
        await SharedPreferences.getInstance();
    if (_email != null) {
      await plumberPrefs.setString('emailPlumber', _email!);
    }
    if (_name != null) {
      await plumberPrefs.setString('namePlumber', _name!);
    }
    if (_currentLocation != null) {
      await plumberPrefs.setString('currentLocationPlumber', _currentLocation!);
    }
    if (_expertiseDescription != null) {
      await plumberPrefs.setString(
          'expertiseDescriptionPlumber', _expertiseDescription!);
    }
    if (_premiumUser != null) {
      await plumberPrefs.setBool('premiumUserPlumber', _premiumUser!);
    }
    if (_distance != null) {
      await plumberPrefs.setDouble('distancePlumber', _distance!);
    }
    if (_phoneNo != null) {
      await plumberPrefs.setString('phoneNoPlumber', _phoneNo!);
    }
  }

  Future<void> getPlumberDataFromPrefs() async {
    SharedPreferences plumberPrefs = await SharedPreferences.getInstance();

    _email = plumberPrefs.getString('emailPlumber')!;
    _name = plumberPrefs.getString('namePlumber')!;
    _currentLocation = plumberPrefs.getString('currentLocationPlumber')!;
    if (plumberPrefs.getString('expertiseDescriptionPlumber') != null) {
      _expertiseDescription = plumberPrefs.getString('expertiseDescriptionPlumber')!;
    }
    _premiumUser = plumberPrefs.getBool('premiumUserPlumber')!;
    _distance = plumberPrefs.getDouble('distancePlumber')!;
    _phoneNo = plumberPrefs.getString('phoneNoPlumber')!;
  }

  double? get distance => _distance;

  bool? get premiumUser => _premiumUser;

  String? get expertiseDescription => _expertiseDescription;

  String? get currentLocation => _currentLocation;

  String? get name => _name;

  String? get email => _email;

  String? get phoneNo => _phoneNo;

// Future<void> clearAllPlumberDataAtPrefs() async {
//   final SharedPreferences plumberPrefs =
//   await SharedPreferences.getInstance();
//
//   await plumberPrefs.clear();
// }

// Future<void> removeAllPlumberDataAtPrefs() async {
//   final SharedPreferences plumberPrefs =
//   await SharedPreferences.getInstance();
//
//   await plumberPrefs.remove('email');
//   await plumberPrefs.remove('name');
//   await plumberPrefs.remove('field');
//   await plumberPrefs.remove('address');
//   await plumberPrefs.remove('current location');
//   await plumberPrefs.remove('phone no');
//   await plumberPrefs.remove('expertise description');
//   await plumberPrefs.remove('latitude');
//   await plumberPrefs.remove('longitude');
//   await plumberPrefs.remove('profileImageUrl');
//   // others
//   await plumberPrefs.remove('service');
//   await plumberPrefs.remove('premium user');
// }

// Future<void> updatePlumberDataAtPrefs({
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
