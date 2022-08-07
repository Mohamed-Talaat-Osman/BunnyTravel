import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/cubit/cubit_states.dart';
import 'package:flutter_cubit/model/data_model.dart';
import 'package:flutter_cubit/screens/detail_screen.dart';
import 'package:flutter_cubit/services/data_services.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.date}) : super(InitialState()){
    emit(WelcomeState());
  }

  final DataServices date;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await date.getInfo();
      emit(LoadedState(places));
    } catch(e){}
  }

  DetailScreen(DataModel data){
    emit(DetailState(data));
  }

  goHome(){
    emit(LoadedState(places));
  }

}