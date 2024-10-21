import 'dart:async';
import 'dart:io';
// import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class BuilderPrefs {

  String? _email;
  String? _name;
  String? _currentLocation;
  String? _expertiseDescription;
  bool? _premiumUser;
  double? _distance;
  String? _phoneNo;


  Future<void> setBuilderDataAtPrefs({
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

    await saveBuilderDataAtPrefs();
  }

  Future<void> saveBuilderDataAtPrefs() async {
    final SharedPreferences builderPrefs =
    await SharedPreferences.getInstance();
    if (_email != null) {
      await builderPrefs.setString('emailBuilder', _email!);
    }
    if (_name != null) {
      await builderPrefs.setString('nameBuilder', _name!);
    }
    if (_currentLocation != null) {
      await builderPrefs.setString('currentLocationBuilder', _currentLocation!);
    }
    if (_expertiseDescription != null) {
      await builderPrefs.setString(
          'expertiseDescriptionBuilder', _expertiseDescription!);
    }
    if (_premiumUser != null) {
      await builderPrefs.setBool('premiumUserBuilder', _premiumUser!);
    }
    if (_distance != null) {
      await builderPrefs.setDouble('distanceBuilder', _distance!);
    } if (_phoneNo != null) {
      await builderPrefs.setString('phoneNoBuilder', _phoneNo!);
    }
  }

  Future<void> getBuilderDataFromPrefs() async {
    SharedPreferences builderPrefs = await SharedPreferences.getInstance();

    _email = builderPrefs.getString('emailBuilder')!;
    _name = builderPrefs.getString('nameBuilder')!;
    _currentLocation = builderPrefs.getString('currentLocationBuilder')!;
    if (builderPrefs.getString('expertiseDescriptionBuilder') != null) {
      _expertiseDescription = builderPrefs.getString('expertiseDescriptionBuilder')!;
    }
    _premiumUser = builderPrefs.getBool('premiumUserBuilder')!;
    _distance = builderPrefs.getDouble('distanceBuilder')!;
    if (builderPrefs.getString('phoneNoBuilder') != null) {
      _phoneNo = builderPrefs.getString('phoneNoBuilder')!;
    }
  }

  double? get distance => _distance;

  bool? get premiumUser => _premiumUser;

  String? get expertiseDescription => _expertiseDescription;

  String? get currentLocation => _currentLocation;

  String? get name => _name;

  String? get email => _email;
  String? get phoneNo => _phoneNo;

// Future<void> clearAllBuilderDataAtPrefs() async {
  //   final SharedPreferences builderPrefs =
  //   await SharedPreferences.getInstance();
  //
  //   await builderPrefs.clear();
  // }

  // Future<void> removeAllBuilderDataAtPrefs() async {
  //   final SharedPreferences builderPrefs =
  //   await SharedPreferences.getInstance();
  //
  //   await builderPrefs.remove('email');
  //   await builderPrefs.remove('name');
  //   await builderPrefs.remove('field');
  //   await builderPrefs.remove('address');
  //   await builderPrefs.remove('current location');
  //   await builderPrefs.remove('phone no');
  //   await builderPrefs.remove('expertise description');
  //   await builderPrefs.remove('latitude');
  //   await builderPrefs.remove('longitude');
  //   await builderPrefs.remove('profileImageUrl');
  //   // others
  //   await builderPrefs.remove('service');
  //   await builderPrefs.remove('premium user');
  // }

  // Future<void> updateBuilderDataAtPrefs({
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
