import 'package:car_rental_vivek_2112/routes/routes_constants.dart';
import 'package:car_rental_vivek_2112/services/navigation_services.dart';
import 'package:car_rental_vivek_2112/widgets/button_widget.dart';
import 'package:car_rental_vivek_2112/widgets/input_text_field.dart';

import 'package:car_rental_vivek_2112/widgets/logo_widget.dart';
import 'package:car_rental_vivek_2112/widgets/text_button_widget.dart';

import 'package:flutter/material.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A90E2), Color(0xFF50E3C2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),
              const LogoWidget(height: 100),
              const SizedBox(height: 20),
              const Text(
                "Welcome Back",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Log in to your account",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A90E2),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text("Email"),
                        InputTextFieldWidget(
                          hintText: "Enter Email",
                          textEditingController: _emailTextController,
                          prefixIcon: const Icon(Icons.email),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        InputTextFieldWidget(
                          hintText: "Password",
                          textEditingController: _passwordTextController,
                          obscureText: true,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: const Icon(Icons.visibility_off),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButtonWidget(
                              buttonTitle: "Forgot Password?",
                              onPressed: () {
                                // Add forgot password logic here
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ButtonWidget(
                          buttonTitle: "Login",
                          onPressed: ()
                          {
                            
                            _handleLogin();
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButtonWidget(
                    buttonTitle: "Sign Up",
                    onPressed: () {
                      NavigationServices()
                          .navigateTo(RoutesConstants.signupScreen);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() == true) {
    
      NavigationServices().navigateTo(RoutesConstants.homeScreen);
    }
  }
}
