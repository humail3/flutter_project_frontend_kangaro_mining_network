import 'dart:async';
import 'dart:io';
// import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class GraphicDesignerPrefs {
  String? _email;
  String? _name;
  String? _currentLocation;
  String? _expertiseDescription;
  bool? _premiumUser;
  double? _distance;
  String? _phoneNo;

  Future<void> setGraphicDesignerDataAtPrefs({
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

    await saveGraphicDesignerDataAtPrefs();
  }

  Future<void> saveGraphicDesignerDataAtPrefs() async {
    final SharedPreferences graphicDesignerPrefs =
        await SharedPreferences.getInstance();
    if (_email != null) {
      await graphicDesignerPrefs.setString('emailGraphicDesigner', _email!);
    }
    if (_name != null) {
      await graphicDesignerPrefs.setString('nameGraphicDesigner', _name!);
    }
    if (_currentLocation != null) {
      await graphicDesignerPrefs.setString(
          'currentLocationGraphicDesigner', _currentLocation!);
    }
    if (_expertiseDescription != null) {
      await graphicDesignerPrefs.setString(
          'expertiseDescriptionGraphicDesigner', _expertiseDescription!);
    }
    if (_premiumUser != null) {
      await graphicDesignerPrefs.setBool('premiumUserGraphicDesigner', _premiumUser!);
    }
    if (_distance != null) {
      await graphicDesignerPrefs.setDouble('distanceGraphicDesigner', _distance!);
    }
    if (_phoneNo != null) {
      await graphicDesignerPrefs.setString('phoneNoGraphicDesigner', _phoneNo!);
    }
  }

  Future<void> getGraphicDesignerDataFromPrefs() async {
    SharedPreferences graphicDesignerPrefs =
        await SharedPreferences.getInstance();

    _email = graphicDesignerPrefs.getString('emailGraphicDesigner')!;
    _name = graphicDesignerPrefs.getString('nameGraphicDesigner')!;
    _currentLocation = graphicDesignerPrefs.getString('currentLocationGraphicDesigner')!;
    if (graphicDesignerPrefs.getString('expertiseDescriptionGraphicDesigner') != null) {
      _expertiseDescription =
          graphicDesignerPrefs.getString('expertiseDescriptionGraphicDesigner')!;
    }
    _premiumUser = graphicDesignerPrefs.getBool('premiumUserGraphicDesigner')!;
    _distance = graphicDesignerPrefs.getDouble('distanceGraphicDesigner')!;
    _phoneNo = graphicDesignerPrefs.getString('phoneNoGraphicDesigner')!;
  }

  double? get distance => _distance;

  bool? get premiumUser => _premiumUser;

  String? get expertiseDescription => _expertiseDescription;

  String? get currentLocation => _currentLocation;

  String? get name => _name;

  String? get email => _email;

  String? get phoneNo => _phoneNo;

// Future<void> clearAllGraphicDesignerDataAtPrefs() async {
//   final SharedPreferences graphicDesignerPrefs =
//   await SharedPreferences.getInstance();
//
//   await graphicDesignerPrefs.clear();
// }

// Future<void> removeAllGraphicDesignerDataAtPrefs() async {
//   final SharedPreferences graphicDesignerPrefs =
//   await SharedPreferences.getInstance();
//
//   await graphicDesignerPrefs.remove('email');
//   await graphicDesignerPrefs.remove('name');
//   await graphicDesignerPrefs.remove('field');
//   await graphicDesignerPrefs.remove('address');
//   await graphicDesignerPrefs.remove('current location');
//   await graphicDesignerPrefs.remove('phone no');
//   await graphicDesignerPrefs.remove('expertise description');
//   await graphicDesignerPrefs.remove('latitude');
//   await graphicDesignerPrefs.remove('longitude');
//   await graphicDesignerPrefs.remove('profileImageUrl');
//   // others
//   await graphicDesignerPrefs.remove('service');
//   await graphicDesignerPrefs.remove('premium user');
// }

// Future<void> updateGraphicDesignerDataAtPrefs({
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
