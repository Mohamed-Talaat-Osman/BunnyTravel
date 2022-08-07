import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/constants/colors.dart';
import 'package:flutter_cubit/cubit/cubit.dart';
import 'package:flutter_cubit/cubit/cubit_states.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/app_button.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';
import 'package:sizer/sizer.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                // Image
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 40.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("http://mark.bslmeiyu.com/uploads/" + detail.place.img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                // Burger icon
                Positioned(
                    top: 5.h,
                    left: 3.w,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<AppCubits>(context).goHome();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 8.w,
                              color: Colors.white,
                            )),
                      ],
                    ),
                ),
                // Card
                Positioned(
                  top: 35.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                    width: 100.w,
                    height: 70.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LargeText(
                                text: detail.place.name,
                                size: 20.sp,
                                color: Colors.black87),
                            RegularText(
                                text: "\$"+ detail.place.price.toString(), size: 18.sp, color: Colors.black87),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                              size: 5.w,
                            ),
                            RegularText(
                              text: detail.place.location,
                              size: 12.sp,
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Wrap(
                                children: List.generate(
                                    5,
                                    (index) => Icon(
                                          Icons.star,
                                          color: index < detail.place.stars
                                              ? AppColors.starColor
                                              : Colors.grey,
                                        ))),
                            SizedBox(
                              width: 2.w,
                            ),
                            RegularText(
                                text: detail.place.stars.toString()+ ".0", size: 12.sp, color: Colors.grey),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        LargeText(
                            text: "People", size: 14.sp, color: Colors.black87),
                        SizedBox(
                          height: 1.h,
                        ),
                        RegularText(
                            text: "Number of people in your group",
                            size: 12.sp,
                            color: Colors.black54),
                        SizedBox(
                          height: 1.h,
                        ),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 2.w),
                                child: AppButton(
                                    text: (index + 1).toString(),
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black87,
                                    background: selectedIndex == index
                                        ? Colors.black54
                                        : AppColors.buttonBackground,
                                    borderColor: selectedIndex == index
                                        ? Colors.black54
                                        : AppColors.buttonBackground,
                                    width: 15.w,
                                    height: 15.w),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        LargeText(
                            text: "Description",
                            size: 14.sp,
                            color: Colors.black87),
                        SizedBox(
                          height: 1.h,
                        ),
                        RegularText(
                            text: detail.place.description,
                            size: 12.sp,
                            color: Colors.black54),
                      ],
                    ),
                  ),
                ),
                // Bottom buttons
                Positioned(
                    left: 5.w,
                    right: 5.w,
                    bottom: 1.h,
                    child: Row(
                      children: [
                        AppButton(
                            icon: Icons.favorite_border,
                            isIcon: true,
                            color: AppColors.mainColor,
                            background: Colors.white,
                            borderColor: AppColors.mainColor,
                            width: 15.w,
                            height: 15.w),
                        SizedBox(width : 3.w),
                        Flexible(
                          child: ResponsiveButton(
                            isResponsive: true,
                            height: 15.w,
                          ),
                        )

                      ],
                    ))
              ],
            ),
          ),
        );
      }
    );
  }
}
