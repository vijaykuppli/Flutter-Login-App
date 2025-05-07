import 'package:flutter/material.dart';

class TabHomeScreen extends StatefulWidget {
  const TabHomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabHomeScreenState();
  }
}

class _TabHomeScreenState extends State<TabHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Home Screen Widget")));
  }
}
