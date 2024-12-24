import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_store/common/services/storage.dart';


class SplashPage extends StatefulWidget {
  // final VoidCallback onInitializationComplete;

  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // _registerServices();
    _navigateToHome();
  }
  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      if(Storage().getBool('firstOpen') == null){
        GoRouter.of(context).go("/onboarding");
      }else{
        GoRouter.of(context).go("/home");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          // background
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/background_splash_screen.png")
                  )
              ),
            ),
          ),

          // // Lớp mờ 50%
          // Positioned.fill(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //     child: Container(
          //       color: Colors.black.withOpacity(0.5), // Màu overlay mờ
          //     ),
          //   ),
          // ),

          // logo
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 300,
              width: 300,
              // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                //color: Colors.white,
                // borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage("assets/icons/logo.png")
                ),
              ),
            ),
          ),

          // branding
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              width: 200,
              // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                //color: Colors.white,
                // borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage("assets/icons/branding.png")
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // void _registerServices() {
  //   GetIt.instance.registerSingleton<Navigation>(
  //     Navigation(),
  //   );
  //   GetIt.instance.registerSingleton<Media>(
  //       Media()
  //   );
  //   GetIt.instance.registerSingleton<CloudStorage>(
  //       CloudStorage()
  //   );
  //   GetIt.instance.registerSingleton<Database>(
  //       Database()
  //   );
  // }
}


