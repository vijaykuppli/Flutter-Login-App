import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  /**
   * Since Function expects int we are sending 0 and 1 value for add/minus clicks
   *////
  final void Function(int isAddButtonClicked) onTap;
  final IconData icon;

  const CustomCircleButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var isAddButtonClicked = icon == Icons.add ? 1 : 0;

    return GestureDetector(
      onTap: () {
        onTap.call(isAddButtonClicked);
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Icon(icon, color: Colors.green, size: 25),
      ),
    );
  }
}
