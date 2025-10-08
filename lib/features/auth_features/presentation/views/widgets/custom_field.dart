import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintTxt,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.suffixIcon,
  });

  final String hintTxt;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintTxt,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          floatingLabelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
