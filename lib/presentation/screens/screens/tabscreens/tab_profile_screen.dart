import 'package:flutter/material.dart';

class TabProfileScreen extends StatefulWidget {
  const TabProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabProfileScreenState();
  }
}

class _TabProfileScreenState extends State<TabProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Profile Screen Widget")));
  }
}