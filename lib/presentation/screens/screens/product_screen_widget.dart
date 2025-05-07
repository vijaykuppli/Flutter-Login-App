import 'package:flutter/material.dart';
import 'package:robosoftassignment/presentation/screens/screens/tabscreens/tab_cart_screen.dart';
import 'package:robosoftassignment/presentation/screens/screens/tabscreens/tab_home_screen.dart';
import 'package:robosoftassignment/presentation/screens/screens/tabscreens/tab_product_screen.dart';
import 'package:robosoftassignment/presentation/screens/screens/tabscreens/tab_profile_screen.dart';

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
            Center(child: TabHomeScreen()),
            Center(child: TabProductScreen()),
            Center(child: TabProfileScreen()),
            Center(child: TabCartScreen()),
          ],
        ),
      ),
    );
  }
}
