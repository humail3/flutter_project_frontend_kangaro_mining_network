import 'package:flutter/material.dart';

import '../constants.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.icon,
      required this.title,
      required this.textColour,
      required this.bgColour,
      required this.function,
      required this.iconColour,
      required this.iconSize});

  final Color textColour;
  final Color bgColour;
  final Color iconColour;
  final Function() function;
  final String title;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: bgColour,
      borderRadius: BorderRadius.circular(15.0),
      child: MaterialButton(
        onPressed: function,
        height: 42.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColour,
              size: iconSize,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              title,
              style: TextStyle(
                  color: textColour,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
