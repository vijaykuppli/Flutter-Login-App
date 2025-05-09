import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:robosoftassignment/data/models/product/product_response.dart';
import 'package:robosoftassignment/data/repositories/product_crud_repository.dart';
import 'package:robosoftassignment/domain/block/auth_state.dart';
import 'package:robosoftassignment/domain/block/cubit/product_cubit.dart';
import 'package:robosoftassignment/presentation/screens/screens/custom_widgets/snack_bar_widget.dart';

class TabHomeScreen extends StatefulWidget {
  TabHomeScreen({super.key, required this.productData});
  ProductResponse productData;

  @override
  State<StatefulWidget> createState() {
    return _TabHomeScreenState();
  }
}

class _TabHomeScreenState extends State<TabHomeScreen> {
  final _formKey = GlobalKey<FormState>(); // 🔑 Form key
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    categoryController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      ProductResponse productResponse = widget.productData;
      titleController.text = productResponse.title.toString();
      priceController.text = productResponse.price.toString();
      descriptionController.text = productResponse.description.toString();
      categoryController.text = productResponse.category.toString();
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: BlocProvider(
            create: (_) => ProductCubit(ProductCrudRepository()),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Add a Product",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        onSaved: (newValue) => titleController.text,
                        controller: titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Title is required';
                          }
                          if (value.length < 3) {
                            return 'Title must be at least 3 characters';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Title',
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: 'Enter title',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: priceController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Price is required';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Price',
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: 'Enter Price',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: descriptionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Description is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Please enter Description',
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: 'Enter atleast 5 character',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                        top: 15,
                        bottom: 0,
                      ),
                      //padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: categoryController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter category';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Category',
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: 'Enter Category',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    BlocConsumer<ProductCubit, ApiState>(
                      listener: (context, state) {
                        if (state is ApiSuccess) {
                          setState(() {
                            context.go("/product");
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            CustomSnackBar(
                              message: 'Product Added Successfully',
                              backgroundColor: Colors.black,
                            ),
                          );
                        } else if (state is ApiFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            CustomSnackBar(
                              message:
                                  'Product Not added Successfully. Please try again later',
                              backgroundColor: Colors.black,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is ApiLoading) {
                          return CircularProgressIndicator();
                        }
                        return ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<ProductCubit>().addProduct(
                                widget.productData,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          ),
                          child: Text("Add a Product"),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
