import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    required String message,
    Color super.backgroundColor = Colors.black,
    super.key,
  }) : super(
         content: Text(message, style: TextStyle(color: Colors.white)),
         duration: const Duration(seconds: 3),
         behavior: SnackBarBehavior.floating,
       );
}
