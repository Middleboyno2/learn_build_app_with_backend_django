import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/services/storage.dart';
import '../../../common/widgets/login_bottom_sheet.dart';

class NotificationWidget extends StatelessWidget {

  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: (){
        if (Storage().getString("accessToken") == null) {
          loginBottomSheet(context);
        }else{
          context.push("/notifications");
        }
      },
      child: Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Badge(
          label: Text("4"),
          child: Icon(
            Icons.notifications,
            color: isDark?
            Colors.grey
                :
            Colors.black54,
          ),
        ),
      ),
    );
  }
}
