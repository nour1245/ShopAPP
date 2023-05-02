import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/shop_models.dart';
import 'package:shop_app/shared/network/endpoints.dart';
import 'package:shop_app/shared/network/remote/diohelper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  late ShopLoginModel loginModel;
  void userRegister({
    required email,
    required password,
    required name,
    required phone,
  }) {
    emit(RegisterLoadState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
      },
    ).then((value) {
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(RegisterSuccessState(loginModel));
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
      print(error.toString());
    });
  }

//obsecure password
  bool isPassword = true;
  var suffix = Icons.visibility;

  void showPassowrd() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ShowRPasswordState());
  }
}
