import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store/common/utils/app_routes.dart';
import 'package:shoes_store/common/widgets/app_style.dart';
import 'package:shoes_store/common/widgets/back_button.dart';
import 'package:shoes_store/common/widgets/logout_bottom_sheet.dart';
import 'package:shoes_store/common/widgets/reusable_text.dart';
import 'package:shoes_store/const/constants.dart';
import 'package:shoes_store/src/category/model/category_model.dart';
import 'package:shoes_store/src/category/notifier/category_notifier.dart';

import '../../../common/utils/kcolors.dart';
import '../../../common/utils/kstrings.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: ReusableText(
          text: AppText.kCategories,
          style: appStyle(18, Kolors.kPrimaryLight, FontWeight.bold)
        ),
      ),
      body: ListView.builder(
        itemCount: categories.length,

        itemBuilder: (context, i){
          Categories category = categories[i];
          return ListTile(
            onTap: (){
              context.read<CategoryNotifier>().setCategory(
                  category.id, category.title
              );
              context.push("/category");

            },
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 18,
              child: Padding(
                padding: EdgeInsets.all(8.h),
                child: SvgPicture.network(
                  category.imageUrl,
                  height: 60,
                ),
              ),
            ),
            title: ReusableText(
              text: category.title,
              style: appStyle(14, Kolors.kGray, FontWeight.w500)
            ),
            trailing: Icon(Icons.chevron_right),
          );
        }

      ),
    );
  }
}
