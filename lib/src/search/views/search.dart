import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store/common/utils/app_routes.dart';
import 'package:shoes_store/common/utils/kcolors.dart';
import 'package:shoes_store/src/search/controllers/search_notifier.dart';
import 'package:shoes_store/src/search/widgets/filter.dart';

import '../widgets/list_item.dart';

class CustomSearch extends StatefulWidget {

  const CustomSearch({
    super.key,
  });

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchNotifier>(
      builder: (context, value, child){
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, // Không hiển thị nút quay lại mặc định
            title: Row(
              children: [
                // Icon với AnimatedContainer
                Container(
                  height: 40.0,
                  width: 40.0,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Kolors.kPrimaryLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: value.toggleAppBar,
                    icon: Icon(
                      value.isExpanded ? Icons.filter_alt : Icons.filter_alt_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                // TextField
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(Icons.search)
                    ),
                  ),
                ),
                SizedBox(width: 5.0),
                // Cancel button
                TextButton(
                  onPressed: () {
                    context.go("/home");
                  },
                  child: Text("Cancel"),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FilterWidget(isExpanded: value.isExpanded),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem()
              ],
            ),
          ),


        );
      },
    );
  }
}
