
import 'package:flutter/material.dart';

class TabProductScreen extends StatefulWidget {
  const TabProductScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabProductScreenState();
  }
}

class _TabProductScreenState extends State<TabProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Product Screen Widget")));
  }
}