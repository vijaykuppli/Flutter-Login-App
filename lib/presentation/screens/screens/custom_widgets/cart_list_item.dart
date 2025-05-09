import 'package:flutter/material.dart';

class CartListItem extends StatefulWidget {
  final int index;
  final int initialValue;

  const CartListItem({
    super.key,
    required this.index,
    required this.initialValue,
  });

  @override
  State<CartListItem> createState() => _ListItemState();
}

class _ListItemState extends State<CartListItem> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        value.toString(),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
