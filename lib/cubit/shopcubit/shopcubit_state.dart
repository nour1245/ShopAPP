import 'package:shop_app/models/shop_models.dart';

import '../../models/fav_model.dart';

abstract class ShopcubitStates {}

class ShopcubitInitial extends ShopcubitStates {}

class BottomBarChangeState extends ShopcubitStates {}

class LoadingHomeState extends ShopcubitStates {}

class LoadSuccessHomeState extends ShopcubitStates {}

class LoadErrorHomeState extends ShopcubitStates {}

class LoadSuccessCategoriesState extends ShopcubitStates {}

class LoadErrorCategoriesState extends ShopcubitStates {}

class LoadSuccessCategoriesDState extends ShopcubitStates {}

class LoadErrorCategoriesDState extends ShopcubitStates {}

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

class AddToCartLoading extends ShopcubitStates {}

class AddToCartLoaded extends ShopcubitStates {}

class AddToCartError extends ShopcubitStates {
  AddToCartError(error);
}

class GetCartLoading extends ShopcubitStates {}

class GetCartLoaded extends ShopcubitStates {}

class GetCartError extends ShopcubitStates {
  GetCartError(error);
}
