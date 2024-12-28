import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_store/common/utils/kstrings.dart';
import 'package:shoes_store/common/widgets/app_style.dart';

import '../../../common/utils/kcolors.dart';
import '../../../const/resource.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_EXPERIENCE_PNG,
            fit: BoxFit.cover
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 180),
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                AppText.kOnboardHome,
                textAlign: TextAlign.center,
                style: appStyle(13, Kolors.kGray, FontWeight.normal),
              ),
            )
          )
        ],
      ),
    );
  }
}
