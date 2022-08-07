import 'package:flutter/material.dart';
import 'package:flutter_cubit/constants/colors.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double? width;
  double? height;

  ResponsiveButton({
    Key? key,
    this.isResponsive = false,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        width: isResponsive == true ? double.maxFinite : width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isResponsive == true ? RegularText(text: "Book Your Trip Now", size: 12.sp, color: Colors.white)
                : Row(
                  children: [
                    RegularText(text: "Skip", size: 12.sp, color: Colors.white),
                    Icon(Icons.navigate_next, color: Colors.white,)
                  ],
                ),
          ],
        ),
    );
  }
}
