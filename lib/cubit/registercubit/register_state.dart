part of 'register_cubit.dart';

abstract class RegisterStates {}

class RegisterInitial extends RegisterStates {}

class RegisterLoadState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final ShopLoginModel loginModel;

  RegisterSuccessState(this.loginModel);
}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}

class ShowRPasswordState extends RegisterStates {}
