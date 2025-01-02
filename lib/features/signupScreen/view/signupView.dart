import 'package:car_rental_vivek_2112/features/signupScreen/model/signup_request.dart';
import 'package:car_rental_vivek_2112/features/signupScreen/viewModel/signup_view_model.dart';
import 'package:car_rental_vivek_2112/services/navigation_services.dart';
import 'package:car_rental_vivek_2112/widgets/button_widget.dart';
import 'package:car_rental_vivek_2112/widgets/input_text_field.dart';
import 'package:car_rental_vivek_2112/widgets/loader_widget.dart';
import 'package:car_rental_vivek_2112/widgets/logo_widget.dart';
import 'package:car_rental_vivek_2112/widgets/text_button_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              const LogoWidget(height: 100),
              const SizedBox(height: 20),
              const Text(
                "Create Your Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Sign up with your name, email, and password",
                style: TextStyle(color: Colors.white70, fontSize: 16),
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
                        InputTextFieldWidget(
                          hintText: "Enter Name",
                          prefixIcon: const Icon(Icons.person),
                          textEditingController: _nameTextController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Text("Email"),
                        InputTextFieldWidget(
                          hintText: "Enter Email",
                          prefixIcon: const Icon(Icons.email),
                          textEditingController: _emailTextController,
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
                        Text("Password"),
                        InputTextFieldWidget(
                          hintText: "Enter Password",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: const Icon(Icons.visibility_off),
                          textEditingController: _passwordTextController,
                          obscureText: true,
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
                        const SizedBox(height: 20),
                        ButtonWidget(
                          buttonTitle: "Sign Up",
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true) {
                              signUpAction();
                            }
                          },
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
                    "Already have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButtonWidget(
                    buttonTitle: "Login",
                    onPressed: () {
                      NavigationServices().goBack();
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

  void signUpAction() async {
    SignUpRequestModel requestModel = SignUpRequestModel(
      name: _nameTextController.text,
      email: _emailTextController.text,
      password: _passwordTextController.text,
    );
    final signUpViewModel = Provider.of<SignUpViewModel>(context, listen: false);
    LoaderWidget.showLoader(message: "Processing your signup...");
    final response = await signUpViewModel.signUpTheUser(requestModel);
    LoaderWidget.hideLoader();
    showAlertMessage(message: response.message ?? "");
  }

  void showAlertMessage({String message = ""}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Alert"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                NavigationServices().goBack();
              },
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}
