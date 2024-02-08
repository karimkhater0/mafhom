import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafhom/modules/account/account_screen.dart';
import 'package:mafhom/modules/saved/saved_screen.dart';
import 'package:mafhom/modules/text_to_sign/text_to_sign_screen.dart';
import 'package:mafhom/shared/cubit/states.dart';

import '../../modules/sign_to_text/sign_to_text_screen.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isLast = false;
  int currentIndex = 0;
  List<Widget> screens = [
    const TTSScreen(),
    const STTScreen(),
    const SavedScreen(),
    const AccountScreen(),
  ];

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

  void changeBottomNavBar(index)
  {
    currentIndex=index;
    emit(AppChangeBottomNavBarState());
  }

}