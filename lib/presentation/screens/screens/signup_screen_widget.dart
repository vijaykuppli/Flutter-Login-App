import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:robosoftassignment/domain/block/auth_state.dart';
import 'package:robosoftassignment/repositories/auth_repository.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>(); // 🔑 Form key
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? _selectedGender;
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
                          return 'Name is required';
                        }
                        if (value.length < 3) {
                          return 'Name must be at least 3 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'FullName',
                        hintText: 'Enter valid name',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                        hintText: 'Enter valid email id as abc@gmail.com',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length <= 9) {
                          return 'PhoneNumber is required';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                        hintText: 'Enter valid Phone number',
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                        ['Male', 'Female', 'Other'].map((gender) {
                          return Row(
                            children: [
                              Radio<String>(
                                value: gender,
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() => _selectedGender = value);
                                },
                              ),
                              Text(gender),
                            ],
                          );
                        }).toList(),
                  ),
                  SizedBox(height: 20),

                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        context.go('/login');
                      } else if (state is LoginFailure) {
                        context.go("/login");
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return CircularProgressIndicator();
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginCubit>().signUp(
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        child: Text("Sign Up"),
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
