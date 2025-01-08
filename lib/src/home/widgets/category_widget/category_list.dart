import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store/common/widgets/app_style.dart';
import 'package:shoes_store/common/widgets/reusable_text.dart';

import 'package:shoes_store/const/constants.dart';
import 'package:shoes_store/src/category/model/category_model.dart';
import 'package:shoes_store/src/category/notifier/category_notifier.dart';
import 'package:shoes_store/src/home/widgets/category_widget/custom_cate_item.dart';

import '../../../../common/utils/kcolors.dart';


class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: SizedBox(
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            categories.length,
            (index){
              final category = categories[index];
              return GestureDetector(
                onTap: () {
                  context
                      .read<CategoryNotifier>()
                      .setCategory(category.id, category.title);
                  context.push('/category');
                },
                child: CustomCateItem(
                  image: category.imageUrl,
                  title: category.title
                ),
              );
            }
          ),
        )
      ),
    );
  }
}
