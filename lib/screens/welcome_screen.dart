import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/constants/colors.dart';
import 'package:flutter_cubit/cubit/cubit.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  var content = {
    "Hiking" : "Mountain hikes give you an incredible sense of freedom along with endurance test",
    "Diving" : "Underwater diving, as a human activity, is the practice of descending below the water's surface to interact with the environment",
    "Kayaking" : "A kayak is a small, narrow watercraft which is typically propelled by means of a double-bladed paddle",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_context, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/" + images[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LargeText(size: 21.sp, text: "Trips", color: Colors.black87),
                      RegularText(text: content.keys.elementAt(index), size: 21.sp, color: Colors.black54),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        width: 75.w,
                        child: RegularText (text: content.values.elementAt(index), size: 14.sp, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      GestureDetector(
                        onTap: (){
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 25.w,
                              child: ResponsiveButton(
                                isResponsive: false,
                                width: 25.w,
                                height: 6.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children:
                      List.generate(3, (indexDots) => Container(
                        margin: EdgeInsets.only(bottom: .5.h),
                        width: 2.w,
                        height: index == indexDots ? 4.h : 1.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: index == indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.5),
                        ),
                      )),
                  ),
                ],),
              ),
            );
          }),
    );
  }
}
