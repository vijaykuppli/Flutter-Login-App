import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.inventory), text: 'Products'),
              Tab(icon: Icon(Icons.settings), text: 'Profile'),
              Tab(icon: Icon(Icons.shopping_cart), text: 'Cart'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Home Screen')),
            Center(child: Text('Products Screen')),
            Center(child: Text('Profile Screen')),
            Center(child: Text('Cart Screen')),
          ],
        ),
      ),
    );
  }
}
