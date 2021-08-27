import 'package:flutter/material.dart';


class CustomButton2 extends StatelessWidget {
  CustomButton2({
    this.onPressed,
    this.height = 56.0,
//    this.width = Sizes.HEIGHT_56,
    this.elevation = 1.0,
    this.borderRadius = 24.0,
    this.iconSize,
    this.icon,
  });

  final VoidCallback onPressed;
  final double height;
//  final double width;
  final double elevation;
  final double borderRadius;
  final double iconSize;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(width: 0.0, style: BorderStyle.none),
      ),
      height: height,
      color: Color(0xFF2762CB),
      child: Center(
        child: Icon(
          icon,
          color: Color(0xFFFFFFFF),
          size: iconSize,
        ),
      ),
    );
  }
}
