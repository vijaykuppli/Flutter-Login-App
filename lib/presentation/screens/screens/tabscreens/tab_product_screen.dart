import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robosoftassignment/data/models/product/product_response.dart';
import 'package:robosoftassignment/data/repositories/product_crud_repository.dart';
import 'package:robosoftassignment/domain/block/auth_state.dart';
import 'package:robosoftassignment/domain/block/cubit/product_cubit.dart';
import 'package:robosoftassignment/presentation/screens/screens/custom_widgets/snack_bar_widget.dart';

class TabProductScreen extends StatefulWidget {
  const TabProductScreen({super.key, required this.onGoToSecondTab});
  final Function(ProductResponse productResponse) onGoToSecondTab;

  @override
  State<StatefulWidget> createState() {
    return _TabProductScreenState();
  }
}

class _TabProductScreenState extends State<TabProductScreen> {
  int apiCount = 0;
  List<ProductResponse> apiProductsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (_) => ProductCubit(ProductCrudRepository()),
          child: BlocConsumer<ProductCubit, ApiState>(
            listener: (context, state) {
              if (state is ApiFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  CustomSnackBar(
                    message: 'Something went wrong. Please try again later...',
                    backgroundColor: Colors.black,
                  ),
                );
              } else if (state is ApiSuccess) {
                Center(child: Text("This is me"));
              }
            },
            builder: (context, state) {
              if (apiCount == 0) {
                context.read<ProductCubit>().getProductsList();
                apiCount++;
              }
              if (state is ApiLoading) {
                return CircularProgressIndicator();
              }
              if (state is ApiSuccess) {
                if (apiProductsList.isEmpty) {
                  apiProductsList =
                      (state.token as List<ProductResponse>)
                          .map((e) => ProductResponse.fromJson(e.toJson()))
                          .toList();
                }

                print("before after api ${apiProductsList.length}");
                return ListView.builder(
                  itemCount: apiProductsList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color:
                          index % 2 == 0 ? Colors.blue[100] : Colors.green[100],
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        leading: Image.network(
                          apiProductsList[index].image!,
                          width: 50,
                          height: 50,
                        ),
                        title: Text(apiProductsList[index].title!),
                        subtitle: Text(
                          apiProductsList[index].description,
                          maxLines: 2,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                          ),
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
                                        localItem.id ==
                                        apiProductsList[index].id,
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
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                widget.onGoToSecondTab(apiProductsList[index]);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(child: Text("Loading Products..."));
              }
            },
          ),
        ),
      ),
    );
  }
}
