import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../const/resource.dart';

class BannerWidget extends StatelessWidget {
  final String image;
  final String link;
  const BannerWidget({super.key, required this.image, required this.link});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: GestureDetector(
          onTap: (){

          },
          child:ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: ScreenUtil().screenHeight/5,
              width: ScreenUtil().screenWidth - 10,
            ),
          ),
        )
      ),
    );
  }
}
