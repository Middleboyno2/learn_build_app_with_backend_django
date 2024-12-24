import 'package:flutter/material.dart';

import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';


class ForgetPasswordPage extends StatefulWidget {
  final PageController pageController;
  const ForgetPasswordPage({super.key, required this.pageController});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
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
    final _formKey = GlobalKey<FormState>();

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
                    controller: _emailController,
                    label: 'Email',
                    hint: 'Enter your email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a email';
                      }
                      return null;
                    },
                  ),

                  // Button
                  AuthButton(
                    text: "Send to email",
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
