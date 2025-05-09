
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:robosoftassignment/data/models/product/product_response.dart';
import 'package:robosoftassignment/data/repositories/cart_repository.dart';
import 'package:robosoftassignment/domain/block/auth_state.dart';
import 'package:robosoftassignment/domain/block/cart_bloc.dart';
import 'package:robosoftassignment/domain/block/cart_event.dart';
import 'package:robosoftassignment/presentation/screens/screens/custom_widgets/custom_circle_button.dart';

class TabCartCheckout extends StatefulWidget {
  const TabCartCheckout({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<TabCartCheckout> {
  final cartRepository = CartRepository();
  List<ProductResponse> apiProductsList = [];
  int incrementOrDecrementWhenTap = 0;
  int initialClickedValue = 0;

  double calculateTotalPrice() {
    double total = 0;
    for (final item in apiProductsList) {
      total += item.price;
    }
    return total;
  }

  void _isAddButtonClicked(int value, int listIndex) {
    setState(() {
      initialClickedValue = value;
      var productResponse = apiProductsList[listIndex];

      if (initialClickedValue == 1) {
        incrementOrDecrementWhenTap++;
      } else {
        incrementOrDecrementWhenTap--;
      }
      apiProductsList[listIndex] = ProductResponse(
        id: productResponse.id,
        title: productResponse.title,
        price: productResponse.price,
        quantity: incrementOrDecrementWhenTap,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(cartRepository)..add(CartCrudEvent()),
      child: Scaffold(
        body: BlocBuilder<CartBloc, ApiState>(
          builder: (context, state) {
            if (state is ApiLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ApiSuccess) {
              if (apiProductsList.isEmpty) {
                apiProductsList =
                    (state.token as List<ProductResponse>)
                        .map((e) => ProductResponse.fromJson(e.toJson()))
                        .toList();
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: apiProductsList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                apiProductsList[index].title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '\$${apiProductsList[index].price.toStringAsFixed(2)}',
                                style: TextStyle(color: Colors.green),
                              ),
                              trailing: Container(
                                color: const Color.fromARGB(255, 245, 231, 231),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomCircleButton(
                                      icon: Icons.remove,
                                      onTap: (value) {
                                        if (incrementOrDecrementWhenTap != 0) {
                                          _isAddButtonClicked(value, index);
                                        }
                                      },
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      apiProductsList[index].quantity
                                          .toString(),
                                    ),
                                    SizedBox(width: 10),
                                    CustomCircleButton(
                                      icon: Icons.add,
                                      onTap:
                                          (value) =>
                                              _isAddButtonClicked(value, index),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(color: Colors.grey, thickness: 0.5),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Total: \$${calculateTotalPrice().toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // ✅ background color
                      foregroundColor:
                          Colors.white, // optional: text/icon color
                    ),
                    onPressed: () {
                      context.go("/checkout");
                    },
                    child: const Text('Checkout'),
                  ),
                ],
              );
            } else if (state is ApiFailure) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
