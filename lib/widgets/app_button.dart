import 'package:flutter/material.dart';
import 'package:flutter_cubit/constants/colors.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class AppButton extends StatelessWidget {
  String? text;
  IconData? icon;
  final Color color;
  final Color background;
  final Color borderColor;
  double height;
  double width;
  bool? isIcon;

  AppButton({
    Key? key,
    required this.color,
    required this.background,
    required this.borderColor,
    required this.width,
    required this.height,
    this.text,
    this.icon,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(15),
        color: background,
      ),
      child: Center(
        child: isIcon == false
            ? RegularText(
                text: text!,
                size: 12.sp,
                color: color,
              )
            : Icon(
                icon,
                color: color,
              ),
      ),
    );
  }
}
