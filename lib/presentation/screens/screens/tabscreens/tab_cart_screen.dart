import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robosoftassignment/data/models/cart/cart_response.dart';
import 'package:robosoftassignment/data/models/product/product_response.dart';
import 'package:robosoftassignment/data/repositories/cart_repository.dart';
import 'package:robosoftassignment/domain/block/auth_state.dart';
import 'package:robosoftassignment/domain/block/cart_bloc.dart';
import 'package:robosoftassignment/domain/block/cart_event.dart';
import 'package:robosoftassignment/presentation/screens/screens/custom_widgets/custom_circle_button.dart';
import 'package:robosoftassignment/presentation/screens/screens/custom_widgets/snack_bar_widget.dart';

class TabCartScreen extends StatefulWidget {
  const TabCartScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabCartScreenState();
  }
}

class _TabCartScreenState extends State<TabCartScreen> {
  final cartRepository = CartRepository();
  List<ProductResponse> apiProductsList = [];

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
              apiProductsList =
                  (state.token as List<ProductResponse>)
                      .map((e) => ProductResponse.fromJson(e.toJson()))
                      .toList();
              return ListView.builder(
                itemCount: state.token.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      leading: Image.network(
                        apiProductsList[index].image!,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(apiProductsList[index].title),
                      subtitle: Text(
                        apiProductsList[index].description,
                        maxLines: 2,
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              /**
                                 * Since delte api it's not working locally deleting the items and reloading it.
                                 */
                              // context.read<ProductCubit>().deleteProduct(
                              //   apiProductsList[index].id,
                              // );
                              setState(() {
                                apiProductsList.removeWhere(
                                  (localItem) =>
                                      localItem.id == apiProductsList[index].id,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  CustomSnackBar(
                                    message:
                                        'Product deleted item successfully',
                                    backgroundColor: Colors.black,
                                  ),
                                );
                              });
                            },
                            icon: Icon(Icons.delete),
                          ),

                          // Padding(
                          //   //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                          //   padding: EdgeInsets.symmetric(horizontal: 15),
                          //   child: TextFormField(
                          //     decoration: InputDecoration(
                          //       border: OutlineInputBorder(),
                          //       labelText: 'Qty',
                          //       hintStyle: TextStyle(color: Colors.grey),
                          //       hintText: 'Qty',
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(width: 10),

                          // CustomCircleButton(),
                          // IconButton(
                          //   icon: Icon(Icons.edit),
                          //   onPressed: () {
                          //     widget.onGoToSecondTab(apiProductsList[index]);
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  );
                },
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
