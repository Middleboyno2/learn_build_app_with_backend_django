import 'package:flutter/material.dart';
import 'package:shoes_store/src/login/views/signup.dart';

import 'forget_password.dart';
import 'login_page.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background_login.png"))),
        child: Stack(
          children: <Widget>[
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                LoginPage(pageController: _pageController),
                SignupPage(pageController: _pageController),
                ForgetPasswordPage(pageController: _pageController)
              ],
            )
          ],
        ),
      ),
    );
  }
}
