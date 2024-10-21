import 'dart:convert';
import 'dart:io';

import 'package:kngro/components/h2_text.dart';
import 'package:kngro/database/register_service_taker.dart';
import 'package:kngro/database/update_service_taker.dart';
import 'package:kngro/screens/main_screen.dart';
// import 'package:kngro/services/location.dart';
import 'package:flutter/material.dart';
import 'package:kngro/components/rounded_button.dart';
import 'package:kngro/constants.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ManageServiceTakerAccountScreen extends StatefulWidget {
  const ManageServiceTakerAccountScreen({super.key});

  static const String id = "manage_service_taker_account_screen";

  @override
  _ManageServiceTakerAccountScreenState createState() =>
      _ManageServiceTakerAccountScreenState();
}

class _ManageServiceTakerAccountScreenState
    extends State<ManageServiceTakerAccountScreen> {
  String? _name;
  String? _address;
  String? _currentLocation;
  // RegisterServiceTaker _registerServiceTaker = new RegisterServiceTaker();
  // UpdateServiceTaker  _updateServiceTaker = new UpdateServiceTaker();
  bool _isObscure = true;
  // Location _location = Location();
  double? _lati;
  double? _longi;
  String? _email;

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  File? _image;
  final ImagePicker _picker = ImagePicker();
  String? _base64Image;
  String? _imageError;

  // just define for not to remove the textfield values even after not foccused
  final _nameFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();

  final _serviceTakerRegistrationFormKey = GlobalKey<FormState>();

  void _navigateToProfileScreen() {
    // Reset form fields and text controllers
    _nameController.clear();
    _addressController.clear();
    _locationController.clear();

    Navigator.pop(context);
  }

  // Future<void> _getLocationData() async {
  //   await _location.getCurrentLocation();
  //
  //   _currentLocation =
  //   '${_location.town!}, ${_location.city!}, ${_location.district!}';
  //
  //   _lati = _location.latitude!;
  //   _longi = _location.longitude!;
  //
  //   setState(() {
  //     Update UI with location details
      // _locationController.text = _currentLocation!;
    // });
  // }

  Future<void> _checkLocationPermission() async {
    PermissionStatus status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      print('Location permission granted');
      // await _getLocationData(); // Call _getLocationData here
    } else if (status.isDenied || status.isPermanentlyDenied) {
      print('Location permission denied');
      openAppSettings();
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Convert XFile to File
      final File file = File(pickedFile.path);

      final compressedFilePath = file.path + '_compressed.jpg';
      final result = await FlutterImageCompress.compressAndGetFile(
        file.path,
        compressedFilePath,
        quality: 85,
      );

      if (result != null) {
        final File compressedFile = File(result.path);
        setState(() {
          _image = compressedFile;
          _base64Image = base64Encode(compressedFile.readAsBytesSync());
        });
      }
    } else {
      print('No image selected.');
    }
  }

  bool _isImageSelected() {
    return _image != null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final email = ModalRoute.of(context)?.settings.arguments as String?;
    if (email != null) {
      _email = email;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameFocusNode.dispose();
    _addressFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _serviceTakerRegistrationFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 150.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const Center(
                child: Text('Service Taker',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              const SizedBox(
                height: 28.0,
              ),
              H2Text(
                title: 'Update profile details',
                edgeInsets: EdgeInsets.only(top: 24.0, bottom: 16.0),
              ),
              TextFormField(
                controller: _nameController,
                focusNode: _nameFocusNode,
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (value) {
                  _name = value;
                },
                autofillHints: [AutofillHints.name],
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Update your Name'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                keyboardType: TextInputType.streetAddress,
                controller: _addressController,
                focusNode: _addressFocusNode,
                style: TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                onChanged: (value) {
                  _address = value;
                },
                autofillHints: [AutofillHints.fullStreetAddress],
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Update your Address'),
              ),
              const SizedBox(height: 8.0),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Expanded(
                  child: TextFormField(
                    controller: _locationController,
                    readOnly: true,
                    style: TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your location';
                      }
                      return null;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Update your location'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RoundedButton('Get', kFirstColor, () async {
                    await _checkLocationPermission();
                  }),
                ),
              ]),
              const SizedBox(
                height: 24.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Expanded(
                  child: Column(children: [
                    DecoratedBox(
                      decoration: kTextDecoration,
                      child: _image == null
                          ? Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Update profile image',
                            style: TextStyle(
                                color: kHintColor,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ))
                          : Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Image.file(
                          _image!,
                          height: 150.0,
                        ),
                      ),
                    ),
                    if (_imageError != null)
                      Text(
                        _imageError!,
                        style: TextStyle(color: Colors.red, fontSize: 12.0),
                      ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RoundedButton(
                    'Select Image',
                    kFirstColor,
                        () async {
                      _pickImage();
                      setState(() {
                        _imageError =
                        null; // Clear error when an image is picked
                      });
                    },
                  ),
                ),
              ]),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton('Update Account', kFirstColor, () async {
                // Validate form fields
                if (_serviceTakerRegistrationFormKey.currentState!
                    .validate()) {
                  // if (_isImageSelected()) {
                  //   // Proceed with form submission, including the image upload,,,, e.g., call your registration method here
                  //
                  //   _serviceTakerRegistrationFormKey.currentState!.save();
                  //
                  //   await _updateServiceTaker.updateUserProfile(
                  //     email: _email,
                  //     name: _name,
                  //     address: _address,
                  //     currentLocation: _currentLocation,
                  //     lati: _lati,
                  //     longi: _longi,
                  //     image: _image,
                  //   )
                  //       ? _navigateToProfileScreen()
                  //       : print('User Registration Failed');
                  // } else {
                  //   // Show an error message or validation feedback
                  //   setState(() {
                  //     _imageError = "Please select a profile image";
                  //   });
                  // }
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
