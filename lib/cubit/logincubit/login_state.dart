part of 'login_cubit.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoadState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final ShopLoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class ShowPasswordState extends LoginStates {}
