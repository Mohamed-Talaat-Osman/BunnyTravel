import 'package:flutter/material.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LargeText(text: "My Screen", size: 20.sp, color: Colors.black54),
    );
  }
}
