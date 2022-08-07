import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/cubit.dart';
import 'package:flutter_cubit/cubit/cubit_states.dart';
import 'package:flutter_cubit/screens/detail_screen.dart';
import 'package:flutter_cubit/screens/nav_screens/bottomNavigationBar.dart';
import 'package:flutter_cubit/screens/nav_screens/home_screen.dart';
import 'package:flutter_cubit/screens/welcome_screen.dart';
import 'package:flutter_cubit/widgets/loading_Indicator.dart';

class CubitLogics extends StatefulWidget {
  const CubitLogics({Key? key}) : super(key: key);

  @override
  State<CubitLogics> createState() => _CubitLogicsState();
}

class _CubitLogicsState extends State<CubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if (state is WelcomeState){
            return WelcomeScreen();
          } if (state is LoadedState){
            return MainScreen();
          } if (state is DetailState){
            return DetailScreen();
          }if (state is LoadingState){
            return LoadingIndicator();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
