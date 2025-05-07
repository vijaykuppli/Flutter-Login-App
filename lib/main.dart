import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:robosoftassignment/data/models/product_response.dart';
import 'package:robosoftassignment/presentation/screens/screens/login_screen_widget.dart';
import 'package:robosoftassignment/presentation/screens/screens/product_screen_widget.dart';
import 'package:robosoftassignment/data/repositories/auth_repository.dart';

void main() {
  runApp(AssignmentApp());
}

class AssignmentApp extends StatelessWidget {
  AssignmentApp({super.key});
  final authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => ProductScreen(productData: ProductResponse())),
    GoRoute(path: '/login', builder: (context, state) => LoginScren()),
    GoRoute(path: '/product', builder: (context, state) => ProductScreen(productData: ProductResponse())),
  ],
);
