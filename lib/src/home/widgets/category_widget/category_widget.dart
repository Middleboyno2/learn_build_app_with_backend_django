import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_store/common/utils/app_routes.dart';
import 'package:shoes_store/common/utils/kcolors.dart';
import 'package:shoes_store/common/widgets/app_style.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(10),
      width: ScreenUtil().screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: appStyle(16, isDark? Kolors.kWhite : Kolors.kDark, FontWeight.w500),
              ),
              GestureDetector(
                onTap: (){
                  // go to page categories
                  context.push("/categories");
                },
                child: Text(
                  "See All",
                  style: appStyle(13, Kolors.kGrayLight, FontWeight.normal),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
