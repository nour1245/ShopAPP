import 'package:shop_app/models/shop_models.dart';
import 'package:shop_app/modules/loginscreen/loginscreen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cash_helper.dart';

signOut(context) {
  CacheHelper.clearData(key: 'token').then((value) {
    if (value) {
      navigatAndReplace(context, LoginScreen());
    }
  });
}

String? token = '';
