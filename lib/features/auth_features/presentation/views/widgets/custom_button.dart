import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonContent,
    this.onTap,
    required this.height,
    required this.width, this.color,
  });
  final Widget buttonContent;
  final Function()? onTap;
  final double height;
  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: buttonContent),
      ),
    );
  }
}
