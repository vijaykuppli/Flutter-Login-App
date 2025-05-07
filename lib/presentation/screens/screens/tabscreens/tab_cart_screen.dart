import 'package:flutter/material.dart';

class TabCartScreen extends StatefulWidget {
  const TabCartScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabCartScreenState();
  }
}

class _TabCartScreenState extends State<TabCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Cart Screen Widget")));
  }
}