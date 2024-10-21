import 'dart:io';

import 'package:kngro/constants.dart';
import 'package:flutter/material.dart';

class RectangleProviderDetails extends StatelessWidget {
  const RectangleProviderDetails({
    super.key,
    this.image,
    this.name,
    this.premiumUser,
    this.currentLocation,
    this.expertiseDescription,
    this.distanceToUser,
    this.field,
    this.phoneNo,
  });

  final File? image;
  final String? name;
  final bool? premiumUser;
  final String? currentLocation;
  final String? expertiseDescription;
  final double? distanceToUser;
  final String? field;
  final String? phoneNo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0, left: 16.0),
      child: Material(
        elevation: 5.0,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: DecoratedBox(
                  decoration: kTextDecoration,
                  child: image == null
                      ? Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Profile Image',
                            style: TextStyle(
                                color: kHintColor,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ))
                      : Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Image.file(
                            image!,
                            height: 150.0,
                          ),
                        ),
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                SizedBox(width: 16.0),
                premiumUser!
                    ? Icon(
                        Icons.person,
                        color: Colors.green,
                        size: 32.0,
                      )
                    : Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 32.0,
                      ),
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      name!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    )),
              ]),
              Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: premiumUser!
                      ? Icon(Icons.radio_button_on_outlined,
                          color: Colors.green)
                      : Icon(Icons.radio_button_on_outlined,
                          color: Colors.grey)),
            ]),
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  field!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Address: $currentLocation',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Distance: ${distanceToUser!.toStringAsFixed(1)} km',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Expertise Description: ${expertiseDescription!}',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Contact: ${phoneNo}',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
