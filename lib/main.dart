import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:robosoftassignment/data/models/product/product_response.dart';
import 'package:robosoftassignment/presentation/screens/screens/login_screen_widget.dart';
import 'package:robosoftassignment/presentation/screens/screens/product_screen_widget.dart';
import 'package:robosoftassignment/data/repositories/auth_repository.dart';
import 'package:robosoftassignment/presentation/screens/screens/signup_screen_widget.dart';
import 'package:robosoftassignment/presentation/screens/screens/tabscreens/ui/checkout_successful_widget.dart';

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
    ShellRoute(
      builder:
          (context, state, child) =>
              CheckoutSuccessfulWidget(),
      routes: [
        GoRoute(
          path: '/checkout',
          builder: (context, state) => const CheckoutSuccessfulWidget(),
        ),
      ],
    ),
    GoRoute(
      path: '/',
      builder:
          (context, state) => SignupScreen(),
    ),
    GoRoute(path: '/login', builder: (context, state) => LoginScren()),
    GoRoute(
      path: '/product',
      builder:
          (context, state) => ProductScreen(productData: ProductResponse()),
    )
  ],
);
