import 'package:flutter/material.dart';

import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';


class SignupPage extends StatefulWidget {
  final PageController pageController;
  const SignupPage({super.key, required this.pageController});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
  }

  void navigateToPage(int page) {
    widget.pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print("Form is valid");
    } else {
      print("Form is not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: (){
                  navigateToPage(0);
                },
                icon: const BackButtonIcon()
            ),
          ),
          // form sign up
          Form(
            key: _formKey,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 65,
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                      ),
                    ),
                  ),

                  // text Name
                  AuthField(
                    controller: _nameController,
                    label: 'Username',
                    hint: 'Enter your username',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),

                  // text Name
                  AuthField(
                    controller: _emailController,
                    label: 'Email',
                    hint: 'Enter your email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),

                  // text Password
                  AuthField(
                    controller: _passwordController,
                    label: 'Password',
                    hint: 'Enter your password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),

                  // text Confirm password
                  AuthField(
                    controller: _confirmPasswordController,
                    label: 'Confirm Password',
                    hint: 'Enter confirm password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      } else if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  // Button
                  AuthButton(
                    text: "Sign up",
                    onPressed: (){
                      _submitForm();
                    },
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
