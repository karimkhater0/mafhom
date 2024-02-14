abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeOnBoardingState extends AppStates {}

class AppChangeBottomNavBarState extends AppStates {}

class ShopChangePasswordVisibilityState extends AppStates {}

class ShopLoginInitialState extends AppStates {}

class ShopLoginSuccessState extends AppStates {}

class ShopLoginLoadingState extends AppStates {}

class ShopRegisterInitialState extends AppStates {}

class ShopRegisterSuccessState extends AppStates {}

class ShopRegisterLoadingState extends AppStates {}

class ShopLoginErrorState extends AppStates {
  final String error;
  ShopLoginErrorState(this.error);
}

class ShopRegisterErrorState extends AppStates {
  final String error;
  ShopRegisterErrorState(this.error);
}
