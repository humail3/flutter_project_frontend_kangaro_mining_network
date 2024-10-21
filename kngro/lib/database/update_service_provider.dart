// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ewages/database/local_image/local_image.dart';
// import 'package:ewages/database/shared_preferences/user_data_shared_preferences.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:path/path.dart' as Path;
//
// class UpdateServiceProvider {
//   late String _email;
//
//   late String _name;
//
//   late String _field;
//
//   late String _address;
//
//   late String _currentLocation;
//
//   late String _phoneNo;
//
//   late String _expertiseDescription;
//
//   final _firestore = FirebaseFirestore.instance;
//
//   late double _lati;
//
//   late double _longi;
//   late File _image;
//   late String _imageUrl;
//   UserDataSharedPreferences _userDataSharedPreferences =
//       UserDataSharedPreferences();
//   LocalImage _serviceProviderProfileImageLocaly = LocalImage();
//
//   Future<bool> updateUserProfile({
//     String? email,
//     String? name,
//     String? field,
//     String? address,
//     String? currentLocation,
//     String? phoneNo,
//     String? expertiseDescription,
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
//     if (field != null) {
//       _field = field;
//     }
//     if (address != null) {
//       _address = address;
//     }
//     if (currentLocation != null) {
//       _currentLocation = currentLocation;
//     }
//     if (phoneNo != null) {
//       _phoneNo = phoneNo;
//     }
//     if (expertiseDescription != null) {
//       _expertiseDescription = expertiseDescription;
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
//       print('User profile updated successfully!');
//       return true;
//     } catch (error) {
//       print('Error updating user profile: $error'); // Return error message
//       return false;
//     }
//   }
//
//   Future<void> _updateUserData() async {
//     Map<String, dynamic> updatedData = {
//       'email': _email,
//       'name': _name,
//       'field': _field,
//       'address': _address,
//       'currentLocation': _currentLocation,
//       'phoneNo': _phoneNo,
//       'expertiseDescription': _expertiseDescription,
//       'latitude': _lati,
//       'longitude': _longi,
//       'profileImageUrl': _imageUrl, // Store image URL here
//     };
//
//     try {
//       await _firestore
//           .collection('service providers')
//           .doc(_email)
//           .update(updatedData);
//       await _userDataSharedPreferences.setUserDataAtPrefs(
//           email: _email,
//           name: _name,
//           field: _field,
//           address: _address,
//           currentLocation: _currentLocation,
//           phoneNo: _phoneNo,
//           expertiseDescription: _expertiseDescription,
//           lati: _lati,
//           longi: _longi,
//           imageUrl: _imageUrl);
//       await _serviceProviderProfileImageLocaly.saveImage(image: _image,imageName: 'userImage');
//       print('User data saved successfully!');
//     } catch (error) {
//       print('Error saving user data: $error');
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
