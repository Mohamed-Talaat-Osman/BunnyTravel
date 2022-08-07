import 'package:flutter/material.dart';
import 'package:flutter_cubit/widgets/app_bar.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // App Bar
          CustomAppBar(),
          SizedBox(height : 5.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            width: double.maxFinite,
            height: 6.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.withOpacity(.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.search, color: Colors.black26,),
                SizedBox(
                  width: 2.w,
                ),
                RegularText(
                  text: "Search",
                  size: 12.sp,
                  color: Colors.black26,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
