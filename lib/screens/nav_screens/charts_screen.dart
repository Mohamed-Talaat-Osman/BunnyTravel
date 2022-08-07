import 'package:flutter/material.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class BarItemScreen extends StatelessWidget {
  const BarItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LargeText(text: "BarItem Screen", size: 20.sp, color: Colors.black54),
    );
  }
}
