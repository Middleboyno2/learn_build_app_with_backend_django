import 'package:flutter/material.dart';

import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';

class LoginPage extends StatefulWidget {
  final PageController pageController;

  const LoginPage({super.key, required this.pageController});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  void navigateToSignup() {
    // Chuyển sang SignupPage
    widget.pageController.animateToPage(
      1,
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
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: const Text(
              'Login',
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
          // text Password
          AuthField(
            controller: _passwordController,
            label: 'Password',
            hint: 'Enter your password',
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
          ),
          // sign up
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                GestureDetector(
                  onTap: navigateToSignup, // Gọi hàm chuyển trang
                  child: const Text(
                    " Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFE173C6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // // forget password
          // GestureDetector(
          //   onTap: navigateToSignup, // Gọi hàm chuyển trang
          //   child: const Text(
          //     "Forget password",
          //     style: TextStyle(
          //       fontSize: 20,
          //       color: Color(0xFF857AF1),
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          // button login
          AuthButton(
            text: "Login",
            onPressed: () {
              _submitForm();
            },
          ),

        ],
      ),
    );
  }
}
