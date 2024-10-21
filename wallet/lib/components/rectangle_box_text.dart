import 'package:flutter/material.dart';

class RectangleBoxText extends StatelessWidget {
  const RectangleBoxText({
    super.key,
    this.title = '',
    this.displayText = '',
  });

  final String title;
  final String displayText;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Material(
        elevation: 1.0,
        color: Colors.white,
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                displayText,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400),
              ),
            ]),
          ),
        ),
      ),
      SizedBox(height: 1.0),
    ]);
  }
}
