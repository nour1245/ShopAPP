import 'package:shop_app/models/searchproducts.dart';
import 'package:shop_app/models/shop_models.dart';

abstract class ShopcubitStates {}

class ShopcubitInitial extends ShopcubitStates {}

class BottomBarChangeState extends ShopcubitStates {}

class LoadingHomeState extends ShopcubitStates {}

class LoadSuccessHomeState extends ShopcubitStates {}

class LoadErrorHomeState extends ShopcubitStates {}

class LoadSuccessCategoriesState extends ShopcubitStates {}

class LoadErrorCategoriesState extends ShopcubitStates {}

class LoadSuccessFavoritesState extends ShopcubitStates {
  final FavoritesModel? model;

  LoadSuccessFavoritesState(this.model);
}

class SuccessFavoritesState extends ShopcubitStates {}

class LoadErrorFavoritesState extends ShopcubitStates {}

class LoadSuccessUserFavoritesState extends ShopcubitStates {}

class LoadErrorUserFavoritesState extends ShopcubitStates {}

class LoadUserFavoritesState extends ShopcubitStates {}

class LoadErrorUserDataState extends ShopcubitStates {}

class LoadingrUserDataState extends ShopcubitStates {}

class LoadUserDataState extends ShopcubitStates {
  final ShopLoginModel? model;

  LoadUserDataState(this.model);
}

class LoadErrorUserDataUpdateState extends ShopcubitStates {}

class LoadUserDataUpdateState extends ShopcubitStates {
  final ShopLoginModel? loginModel;

  LoadUserDataUpdateState(this.loginModel);
}

class LoadingUserDataUpdate extends ShopcubitStates {}
