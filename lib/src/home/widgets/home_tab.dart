import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_store/common/widgets/app_style.dart';
import 'package:shoes_store/common/widgets/tab_widget.dart';
import 'package:shoes_store/const/constants.dart';

import '../../../common/utils/kcolors.dart';

class HomeTab extends StatelessWidget {
  final TabController tabController;
  const HomeTab({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 22.h,
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
          color: Kolors.kPrimary,
          borderRadius: BorderRadius.circular(12),
        ),
        labelPadding: EdgeInsets.zero,
        labelColor: isDark? Kolors.kWhite: Kolors.kDark,
        labelStyle: appStyle(11, Kolors.kPrimary, FontWeight.w500),
        unselectedLabelStyle: appStyle(11, Kolors.kGray, FontWeight.normal),
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        tabs: List.generate(
          homeTabs.length, 
          (index){
            return Tab(
              child: TabWidget(text: homeTabs[index]),
            );
          }
        )
      ),
    );
  }
}
