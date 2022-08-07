import 'package:flutter/material.dart';
import 'package:flutter_cubit/constants/colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.mainColor,
      ),
    );
  }
}
