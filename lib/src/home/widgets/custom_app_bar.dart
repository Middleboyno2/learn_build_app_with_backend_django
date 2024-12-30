import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shoes_store/common/utils/kcolors.dart';
import 'package:shoes_store/common/widgets/app_style.dart';
import 'package:shoes_store/common/widgets/reusable_text.dart';
import 'package:shoes_store/src/home/widgets/notification_widget.dart';

class CustomAppBar extends StatelessWidget {
  final bool isSearch;
  final VoidCallback changeSearch;

  const CustomAppBar({
    super.key,
    required this.isSearch,
    required this.changeSearch,

  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      backgroundColor: Colors.transparent.withOpacity(0.2),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
            text: "Location",
            style: appStyle(12, Kolors.kWhite, FontWeight.normal)
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 20,
                color: isDarkTheme? Kolors.kPrimaryLight : Kolors.kPrimary ,
              ),
              SizedBox(
                width: 5.w,
              ),
              SizedBox(
                width: ScreenUtil().screenWidth * 0.5,
                child: Text(
                  "Please select a location",
                  style: appStyle(
                    14,
                    isDarkTheme? Kolors.kWhite: Kolors.kDark,
                    FontWeight.w500
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: (){
            changeSearch();
          },
          icon: Icon(Icons.search),
        ),
        NotificationWidget()
      ],
    );
  }
}
