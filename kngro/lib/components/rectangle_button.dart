import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  const RectangleButton({
    super.key,
    this.title = '',
    this.leftIcon,
    this.rightIcon,
    this.function,
    this.textStyle,
    this.leftIconColour,
    this.bottomSizedBoxHeight,
  });

  final String title;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Function()? function;
  final TextStyle? textStyle;
  final Color? leftIconColour;
  final double? bottomSizedBoxHeight;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Material(
        elevation: 1.0,
        color: Colors.white,
        child: MaterialButton(
          onPressed: function,
          child: Padding(
            padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Container(
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (leftIcon != null) ...[
                          Icon(
                            leftIcon,
                            size: 24.0,
                            color: leftIconColour ?? Colors.grey,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                        ],
                        Text(
                          title,
                          style: textStyle ??
                              TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Icon(
                      rightIcon,
                      size: 32.0,
                      color: Colors.grey,
                    ),
                  ]),
            ),
          ),
        ),
      ),
      SizedBox(height: bottomSizedBoxHeight ?? 5.0),
    ]);
  }
}
