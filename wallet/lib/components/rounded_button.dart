import 'package:wallet/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(this.title, this.colour, this.function, {super.key});

  final Color colour;
  final Function() function;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: function,
          // minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,style: TextStyle(color:kTextBlackColor,fontWeight: FontWeight.bold,fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
