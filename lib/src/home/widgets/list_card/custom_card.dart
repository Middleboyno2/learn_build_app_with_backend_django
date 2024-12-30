import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../const/resource.dart';

class CustomCard extends StatelessWidget {
  final bool isSelect;
  const CustomCard({super.key, required this.isSelect});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          width: ScreenUtil().screenWidth / 1.5,
          height: ScreenUtil().screenHeight / 2.3,
          padding: const EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(R.ASSETS_IMAGES_WAVE_JPEG),
              fit: BoxFit.cover
            ),

            borderRadius: BorderRadius.circular(12)
          ),

        ),
      ],
    );
  }
}
