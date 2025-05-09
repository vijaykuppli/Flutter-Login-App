import 'package:flutter/material.dart';
import 'package:robosoftassignment/data/models/product/product_response.dart';
import 'package:robosoftassignment/presentation/screens/screens/tabscreens/tab_cart_checkout.dart';
import 'package:robosoftassignment/presentation/screens/screens/tabscreens/tab_home_screen.dart';
import 'package:robosoftassignment/presentation/screens/screens/tabscreens/tab_product_screen.dart';
import 'package:robosoftassignment/presentation/screens/screens/tabscreens/tab_profile_screen.dart';

// ignore: must_be_immutable
class ProductScreen extends StatefulWidget {
  ProductScreen({super.key, required this.productData});
  ProductResponse productData;
  @override
  State<StatefulWidget> createState() {
    return _ProductScreenState();
  }
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void switchToHomeTab(ProductResponse productResponse) {
    setState(() {
      widget.productData = productResponse;
    });
    tabController.animateTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.inventory), text: 'Products'),
              Tab(icon: Icon(Icons.settings), text: 'Profile'),
              Tab(icon: Icon(Icons.shopping_cart), text: 'Cart'),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Center(child: TabHomeScreen(productData: widget.productData)),
            Center(child: TabProductScreen(onGoToSecondTab: switchToHomeTab)),
            Center(child: TabProfileScreen()),
            Center(child: TabCartCheckout()),
          ],
        ),
      ),
    );
  }
}
