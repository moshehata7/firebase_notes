import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonContent, this.onTap});
  final Widget buttonContent;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 440,
        decoration: BoxDecoration(
          color: Color(0xff273b7a),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: buttonContent),
      ),
    );
  }
}
