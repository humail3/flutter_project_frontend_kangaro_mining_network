// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ewages/database/shared_preferences/app_data_shared_preferences.dart';
// import 'package:ewages/database/local_image/local_image.dart';
// import 'package:ewages/database/shared_preferences/login_shared_preferences.dart';
// import 'package:ewages/database/shared_preferences/user_data_shared_preferences.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:path/path.dart' as Path;
//
// class RegisterServiceProvider {
//   late String _username ;
//   late String _email ;
//   late String _password ;
//   late String _name ;
//   late String _field ;
//   late String _address ;
//   late String _currentLocation ;
//   late String _phoneNo ;
//   late String _expertiseDescription ;
//   final _auth = FirebaseAuth.instance;
//   final _firestore = FirebaseFirestore.instance;
//   late double _lati ;
//   late double _longi;
//   late File _image;
//   late String _imageUrl;
//   late String _service='Service provider';
//   late bool _premiumUser=false;
//   UserDataSharedPreferences _userDataSharedPreferences = UserDataSharedPreferences();
//   LocalImage _serviceProviderProfileImageLocaly = LocalImage();
//   LoginSharedPreferences _loginSharedPreferences = LoginSharedPreferences();
//
//   Future<bool> createNewUser({
//     String? username,
//     String? email,
//     String? password,
//     String? name,
//     String? field,
//     String? address,
//     String? currentLocation,
//     String? phoneNo,
//     String? expertiseDescription,
//     double? lati,
//     double? longi,
//     File? image,}
//   ) async {
//     if(username!=null){_username = username;}
//     if(email!=null){_email = email;}
//     if(password!=null){_password = password;}
//     if(name!=null){_name = name;}
//     if(field!=null){_field = field;}
//     if(address!=null){_address = address;}
//     if(currentLocation!=null){_currentLocation = currentLocation;}
//     if(phoneNo!=null){_phoneNo = phoneNo;}
//     if(expertiseDescription!=null){_expertiseDescription = expertiseDescription;}
//     if(lati!=null){_lati = lati;}
//     if(longi!=null){_longi = longi;}
//     if(image!=null){_image = image;}
//
//     try {
//       await createUserWithEmailPassword();
//       _imageUrl=(await uploadImage(_image))!;
//       await saveUserData();
//       print('User created successfully!');
//       await _loginSharedPreferences.setUserLoginAtSharedPreferences(true);
//       return true;
//     } catch (error) {
//       print('Error creating user: $error'); // Return error message
//       await _loginSharedPreferences.setUserLoginAtSharedPreferences(false);
//       return false;
//     }
//   }
//
//   Future<void> saveUserData() async {
//     // Check if user is signed in (alternative approach)
//     final user = _auth.currentUser;
//     if (user == null) {
//       throw Exception('No user signed in');
//     }
//
//     final String uid = user.uid;
//     Map<String, dynamic> userData = {
//       'username': _username,
//       'email': _email,
//       'password': _password,
//       'uid': uid,
//       'name': _name,
//       'field': _field,
//       'address': _address,
//       'currentLocation': _currentLocation,
//       'phoneNo': _phoneNo,
//       'expertiseDescription': _expertiseDescription,
//       // others
//       'service': _service,
//       'premium user': _premiumUser,
//       'latitude': _lati,
//       'longitude': _longi,
//       'profileImageUrl': _imageUrl, // Store image URL here
//     };
//
//     try {
//       await _firestore.collection('service providers').doc(_email).set(userData);
//       await _userDataSharedPreferences.setUserDataAtPrefs(username: _username, email: _email, name:_name,field:
//           _field,address:  _address,currentLocation:  _currentLocation,phoneNo:  _phoneNo,expertiseDescription:  _expertiseDescription,
//           lati: _lati,longi:  _longi,imageUrl:  _imageUrl,service:  _service,premiumUser:  _premiumUser);
//       await _serviceProviderProfileImageLocaly.saveImage(image: _image, imageName: 'userImage');
//       print('User data saved successfully!');
//     } catch (error) {
//       print('Error saving user data: $error');
//     }
//   }
//
//   Future<void> createUserWithEmailPassword() async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: _email, password: _password);
//     } catch (e) {
//       print('Error creating user with email and password: $e');
//       print(e);
//     }
//   }
//
//   Future<String?> uploadImage(File imageFile) async {
//     try {
//       firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
//           .ref()
//           .child('profile_images/${Path.basename(imageFile.path)}');
//
//       await ref.putFile(imageFile);
//
//       // Return download URL
//       return await ref.getDownloadURL();
//     } catch (e) {
//       print('Error uploading image: $e');
//       return null;
//     }
//   }
// }
