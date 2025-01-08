import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/utils/kcolors.dart';
import '../../../../common/widgets/app_style.dart';
import '../../../../common/widgets/reusable_text.dart';

class CustomCateItem extends StatelessWidget {
  final String image;
  final String title;
  const CustomCateItem({
    super.key,
    required this.image,
    required this.title
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Kolors.kSecondaryLight
          ),
          child: SvgPicture.network(
            image,
            width: 40.w,
            height: 40.h,
          ),
        ),
        ReusableText(
            text: "${title}",
            style: appStyle(13, Kolors.kGray, FontWeight.w500)
        ),



      ],
    );
  }
}
