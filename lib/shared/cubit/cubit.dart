import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafhom/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isLast = false;

  void changeOnBoardingPage(int index){
    if(index == 2){
      isLast=true;
      emit(AppChangeOnBoardingState());
    }
    else{
      isLast=false;
      emit(AppChangeOnBoardingState());
    }
  }

}