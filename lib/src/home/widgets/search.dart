import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_store/common/utils/kcolors.dart';

class CustomSearch extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback changeSearch;
  final bool isSearch;
  const CustomSearch({
    super.key, 
    required this.controller,
    required this.changeSearch,
    required this.isSearch
  });

  @override
  Widget build(BuildContext context) {
    return isSearch == false ?
    const SizedBox(
      height: 0,
    )
        :
    Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Container(
            width: ScreenUtil().screenWidth,
            height: 110.h,
            padding: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
              top:40.h,
              bottom: 10.h
            ),
            decoration: const BoxDecoration(
              color: Kolors.kWhite,
              border: Border(
                bottom: BorderSide(
                  color: Kolors.kGray,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.search),
                      iconColor: Kolors.kGray,
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                TextButton(
                  onPressed: (){
                    changeSearch();
                  },
                  child: Text("Cancel"),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              color: Colors.black.withOpacity(0.5),

            ),
          ),
        ],
      ),
    );
  }
}
