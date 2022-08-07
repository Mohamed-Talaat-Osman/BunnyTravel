import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/cubit.dart';
import 'package:flutter_cubit/cubit/cubit_states.dart';
import 'package:flutter_cubit/widgets/app_bar.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  var images = {
    "balloning.png" : "Ice skating",
    "hiking.png" : "Hiking",
    "kayaking.png" : "Kayaking",
    "snorkling.png" : "Snorkling",
    "saffari.png" : "Safari",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if (state is LoadedState){
            var info = state.places;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar
              CustomAppBar(),
              // Discover
              Padding(
                padding: EdgeInsets.only(left: 5.w, top: 4.h, bottom: 2.h),
                child:
                LargeText(text: "Discover", size: 22.sp, color: Colors.black87),
              ),
              // Tab Bar
              TabBar(
                  labelPadding: EdgeInsets.only(left: 5.w, right: 5.w),
                  controller: _tabController,
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.grey,
                  tabs: const [
                    Tab(text: "Places"),
                    Tab(text: "Inspiration"),
                    Tab(text: "Emotions"),
                  ]),
              // Tab Bar View
              Container(
                padding: EdgeInsets.only(left: 3.w, top: 2.h),
                height: 40.h,
                width: double.maxFinite,
                child: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                    itemCount: info.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          BlocProvider.of<AppCubits>(context).DetailScreen(info[index]);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 3.w),
                          width: 50.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage("http://mark.bslmeiyu.com/uploads/" + info[index].img),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Text("data"),
                  Text("Bey"),
                ]),
              ),
              // Explore more
              Padding(
                padding:
                EdgeInsets.only(left: 5.w, right: 5.w, top: 3.h, bottom: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LargeText(
                        text: "Explore more", size: 14.sp, color: Colors.black87),
                    RegularText(text: "See all", size: 14, color: Colors.black38),
                  ],
                ),
              ),
              // Explore more cards
              Container(
                height: 13.h,
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 3.w),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (_context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 4.w),
                            width: 20.w,
                            height: 20.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue.withOpacity(0.1),
                              image: DecorationImage(
                                image: AssetImage("img/" + images.keys.elementAt(index)),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 4.w,top: 1.h),
                            child: RegularText(
                              text: images.values.elementAt(index),
                              size: 12,
                              color: Colors.black54,
                            ),
                          )
                        ],
                      );
                    }),
              ),
            ],
          );
          } else {
            return Container();
          }
        },
      )
    );
  }
}
