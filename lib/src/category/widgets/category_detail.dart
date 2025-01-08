import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store/common/widgets/app_style.dart';
import 'package:shoes_store/common/widgets/logout_bottom_sheet.dart';
import 'package:shoes_store/common/widgets/reusable_text.dart';
import 'package:shoes_store/src/category/notifier/category_notifier.dart';

import '../../../common/utils/kcolors.dart';
import '../../../common/widgets/back_button.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: ReusableText(
          text: context.read<CategoryNotifier>().category,
          style: appStyle(16, Kolors.kPrimaryLight, FontWeight.bold),
        ),
        centerTitle: true,
      ),
    );
  }
}
