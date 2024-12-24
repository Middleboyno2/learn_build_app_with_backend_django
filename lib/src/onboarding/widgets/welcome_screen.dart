import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_store/common/services/storage.dart';
import 'package:shoes_store/common/utils/app_routes.dart';
import 'package:shoes_store/common/utils/kcolors.dart';
import 'package:shoes_store/common/utils/kstrings.dart';
import 'package:shoes_store/common/widgets/app_style.dart';
import 'package:shoes_store/common/widgets/custom_button.dart';
import 'package:shoes_store/common/widgets/reusable_text.dart';

import '../../../const/resource.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Image.asset(R.ASSETS_IMAGES_GETSTARTED_PNG),
            SizedBox(
              height: 30.h,
            ),
            Text(
              AppText.kWelcomeHeader,
              textAlign: TextAlign.center,
              style: appStyle(24, Kolors.kPrimary, FontWeight.bold),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth - 100,
              child: Text(
                AppText.kOnboardHome,
                textAlign: TextAlign.center,
                style: appStyle(12, Kolors.kGray, FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GradientBtn(
              text: AppText.kGetStarted,
              radius: 12,
              onTap: () {
                // Storage().setBool("firstOpen", true);
                context.go("/home");
              },
              btnHieght: 35,
              btnWidth: ScreenUtil().screenWidth - 100,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableText(
                  text: "Already have an account?",
                  style: appStyle(12, Kolors.kDark, FontWeight.normal),
                ),
                TextButton(
                  onPressed: () {
                    context.go("/login");
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
