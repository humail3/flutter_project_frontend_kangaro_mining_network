import 'dart:convert';

import 'package:kngro/components/h2_text.dart';
import 'package:kngro/components/rounded_button.dart';
import 'package:kngro/constants.dart';
import 'package:kngro/database/update_service_provider.dart';
// import 'package:kngro/services/location.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ManageServiceProviderAccountScreen extends StatefulWidget {
  const ManageServiceProviderAccountScreen({super.key});

  static const String id = "manage_service_provider_account_screen";

  @override
  _ManageServiceProviderAccountScreenState createState() =>
      _ManageServiceProviderAccountScreenState();
}

class _ManageServiceProviderAccountScreenState
    extends State<ManageServiceProviderAccountScreen> {
  String _name = '';
  String? _email ;
  String _field = '';
  String _address = '';
  String _currentLocation = '';
  String _phoneNo = '';
  String _expertiseDescription = '';
  bool _isObscure = true;
  // Location _location = Location();
  double _lati = 0.0;
  double _longi = 0.0;
  // UpdateServiceProvider _updateServiceProvider = UpdateServiceProvider();

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  final _phoneNoController = TextEditingController();
  final _expertiseDescriptionController = TextEditingController();

  File? _image;
  final ImagePicker _picker = ImagePicker();
  String? _base64Image;
  String? _imageError;

  final _emailFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  final _fieldFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _phoneNoFocusNode = FocusNode();
  final _expertiseDescriptionFocusNode = FocusNode();

  final _serviceProvideRegistrationFormKey = GlobalKey<FormState>();

  void _navigateToProfileScreen() {
    // Reset form fields and text controllers
    _nameController.clear();
    _addressController.clear();
    _locationController.clear();
    _phoneNoController.clear();
    _expertiseDescriptionController.clear();

    Navigator.pop(context);
  }

  // Future<void> _getLocationData() async {
  //   await _location.getCurrentLocation();
  //
  //   _currentLocation =
  //       '${_location.town!}, ${_location.city!}, ${_location.district!}';
  //
  //   _lati = _location.latitude!;
  //   _longi = _location.longitude!;
  //
  //   setState(() {
  //     // Update UI with location details
  //     _locationController.text = _currentLocation;
  //   });
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
    _emailFocusNode.dispose();
    _nameFocusNode.dispose();
    _fieldFocusNode.dispose();
    _addressFocusNode.dispose();
    _phoneNoFocusNode.dispose();
    _expertiseDescriptionFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(children: <Widget>[
          Hero(
            tag: 'logo',
            child: Container(
              height: 150.0,
              child: Image.asset('images/logo_transparent.png'),
            ),
          ),
          const Center(
            child: Text('Service Provider',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Form(
            key: _serviceProvideRegistrationFormKey,
            child: Expanded(
              child: ListView(children: [
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
                DropdownButtonFormField<String>(
                  hint: Text(
                    'Update your field',
                    style: TextStyle(color: Colors.grey),
                  ),
                  decoration: kDropdownFieldDecoration,
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  focusNode: _fieldFocusNode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your field';
                    }
                    return null;
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'Builder',
                      child:
                          Text('Builder', style: TextStyle(color: Colors.blue)),
                    ),
                    DropdownMenuItem(
                      value: 'Care Taker',
                      child: Text('Care Taker',
                          style: TextStyle(color: Colors.blue)),
                    ),
                    DropdownMenuItem(
                      value: 'Doctor',
                      child:
                          Text('Doctor', style: TextStyle(color: Colors.blue)),
                    ),
                    DropdownMenuItem(
                      value: 'Electrical Engineer',
                      child: Text('Electrical Engineer',
                          style: TextStyle(color: Colors.blue)),
                    ),
                    DropdownMenuItem(
                      value: 'Graphic Designer',
                      child: Text('Graphic Designer',
                          style: TextStyle(color: Colors.blue)),
                    ),
                    DropdownMenuItem(
                      value: 'Labour',
                      child:
                          Text('Labour', style: TextStyle(color: Colors.blue)),
                    ),
                    DropdownMenuItem(
                      value: 'Mechanic',
                      child: Text('Mechanic',
                          style: TextStyle(color: Colors.blue)),
                    ),
                    DropdownMenuItem(
                      value: 'Plumber',
                      child:
                          Text('Plumber', style: TextStyle(color: Colors.blue)),
                    ),
                    DropdownMenuItem(
                      value: 'Developer',
                      child: Text('Developer',
                          style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _field = value!;
                    });
                  },
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
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _phoneNoController,
                  focusNode: _phoneNoFocusNode,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _phoneNo =
                        value.replaceAll(' ', ''); // This removes all spaces
                  },
                  autofillHints: [AutofillHints.telephoneNumber],
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Update your Phone Number'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _expertiseDescriptionController,
                  focusNode: _expertiseDescriptionFocusNode,
                  maxLines: 4,
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your expertise';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _expertiseDescription = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Update your describe about your Expertise...'),
                ),
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
                // Submit Button
                RoundedButton('Update Account', kFirstColor, () async {
                  // Validate form fields
                  if (_serviceProvideRegistrationFormKey.currentState!
                      .validate()) {
                    // if (_isImageSelected()) {
                    //   // Proceed with form submission, including the image upload,,,, e.g., call your registration method here
                    //
                    //   _serviceProvideRegistrationFormKey.currentState!.save();
                      // bool success =
                          // await _updateServiceProvider.updateUserProfile(
                      //   email: _email,
                      //   name: _name,
                      //   field: _field,
                      //   address: _address,
                      //   currentLocation: _currentLocation,
                      //   phoneNo: _phoneNo,
                      //   expertiseDescription: _expertiseDescription,
                      //   lati: _lati,
                      //   longi: _longi,
                      //   image: _image!,
                      // );
                    //   if (success) {
                    //     _navigateToProfileScreen();
                    //   } else {
                    //     print('User Registration Failed');
                    //   }
                    // } else {
                    //   // Show an error message or validation feedback
                    //   setState(() {
                    //     _imageError = "Please select a profile image";
                    //   });
                    // }
                  }
                }),
                const SizedBox(
                  height: 44.0,
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
