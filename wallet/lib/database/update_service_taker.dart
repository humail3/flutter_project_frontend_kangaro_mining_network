// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ewages/database/local_image/local_image.dart';
// import 'package:ewages/database/shared_preferences/user_data_shared_preferences.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:path/path.dart' as Path;
//
// class UpdateServiceTaker {
//   late String _email;
//   late String _name;
//   late String _address;
//   late String _currentLocation;
//   late double _lati;
//   late double _longi;
//   late File _image;
//   late String _imageUrl;
//   final _firestore = FirebaseFirestore.instance;
//   UserDataSharedPreferences _userDataSharedPreferences =
//   UserDataSharedPreferences();
//   LocalImage _serviceTakerProfileImageLocaly = LocalImage();
//
//   Future<bool> updateUserProfile({
//     String? email,
//     String? name,
//     String? address,
//     String? currentLocation,
//     double? lati,
//     double? longi,
//     File? image,
//   }) async {
//     if (email != null) {
//       _email = email;
//     }
//     if (name != null) {
//       _name = name;
//     }
//     if (address != null) {
//       _address = address;
//     }
//     if (currentLocation != null) {
//       _currentLocation = currentLocation;
//     }
//     if (lati != null) {
//       _lati = lati;
//     }
//     if (longi != null) {
//       _longi = longi;
//     }
//     if (image != null) {
//       _image = image;
//     }
//
//     try {
//       _imageUrl = (await uploadImage(_image))!;
//       await _updateUserData();
//       print('User data update successfully!');
//       return true;
//     } catch (error) {
//       print('Error updating user data: $error');
//       return false;
//     }
//   }
//
//   Future<void> _updateUserData() async {
//     Map<String, dynamic> updatedData = {
//       'name': _name,
//       'address': _address,
//       'current location': _currentLocation,
//       'latitude': _lati,
//       'longitude': _longi,
//       'profileImageUrl': _imageUrl, // Store image URL here
//     };
//
//     try {
//       await _firestore.collection('service takers').doc(_email).update(updatedData);
//       await _userDataSharedPreferences.setUserDataAtPrefs(
//           name: _name,
//           address: _address,
//           currentLocation: _currentLocation,
//           lati: _lati,
//           longi: _longi,
//           imageUrl: _imageUrl,
//       );
//       await _serviceTakerProfileImageLocaly.saveImage(image: _image,imageName: 'userImage');
//       print('User data updated successfully!');
//     } catch (error) {
//       print('Error updating user data: $error');
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
