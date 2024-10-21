import 'package:flutter/material.dart';

class H2Text extends StatelessWidget {
  const H2Text({super.key,required this.title,this.edgeInsets});

  final String title;
  final EdgeInsetsGeometry? edgeInsets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets ?? EdgeInsets.only(top: 24.0, bottom: 16.0, left: 16.0),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w700),
      ),
    );
  }
}
