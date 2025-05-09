import 'package:flutter/material.dart';

class CheckoutSuccessfulWidget extends StatelessWidget {
  const CheckoutSuccessfulWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Checked Out Successfully",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    );
  }
}
