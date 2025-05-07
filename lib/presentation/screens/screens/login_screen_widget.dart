import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:robosoftassignment/domain/block/auth_state.dart';
import 'package:robosoftassignment/data/repositories/auth_repository.dart';
import 'package:robosoftassignment/domain/block/cubit/login_cubit.dart';

class LoginScren extends StatefulWidget {
  const LoginScren({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginScren> {
  final _formKey = GlobalKey<FormState>(); // 🔑 Form key
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: BlocProvider(
            create: (_) => LoginCubit(AuthRepository()),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 100,
                        /*decoration: BoxDecoration( 
                        color: Colors.red, 
                        borderRadius: BorderRadius.circular(50.0)),*/
                        child: Image.asset('assets/robo.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter valid email',
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: 'Enter valid email id as abc@gmail.com',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      top: 15,
                      bottom: 0,
                    ),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: 'Password',
                        hintText: 'Enter secure password',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  BlocConsumer<LoginCubit, ApiState>(
                    listener: (context, state) {
                      if (state is ApiSuccess) {
                        context.push('/product');
                      } else if (state is ApiFailure) {
                        context.push("/product");
                      }
                    },
                    builder: (context, state) {
                      if (state is ApiLoading) {
                        return CircularProgressIndicator();
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        child: Text("Log In"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
