import 'package:flutter/material.dart';

class Messages {
  static  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> extractSnackBar(
    BuildContext context, {
    required String text,
  }) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(text)));
  }
}

