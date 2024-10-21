import 'package:wallet/constants.dart';
import 'package:flutter/material.dart';

class RoundedServiceButton extends StatelessWidget {
  const RoundedServiceButton(this.icn, this.title, this.function, {super.key});

  final IconData icn;
  final String title;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kFirstColor, width: 2.0),
          // Set stroke color and width
          borderRadius: BorderRadius.circular(10.0), // Match the border radius
        ),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(10.0),
          child: MaterialButton(
            height: 100.0,
            onPressed: function,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // Ensure the column fits within the button size
              children: [
                Icon(
                  icn,
                  color: kFirstColor,
                  size: 40.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: kFirstColor,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
