import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomCircleButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 20,
        height: 20,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 59, 227, 87),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.add, color: Colors.green, size: 25),
      ),
    );
  }
}
