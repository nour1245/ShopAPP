import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/shopcubit/shopcubit_state.dart';
import 'package:shop_app/models/get_cart.dart';
import 'package:shop_app/models/shop_models.dart';
import 'package:shop_app/modules/categoriesssreen/categories.dart';
import 'package:shop_app/modules/favoritesscreen/favorites.dart';
import 'package:shop_app/modules/productsscreen/products.dart';
import 'package:shop_app/modules/settingsscreen/settings.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/endpoints.dart';
import 'package:shop_app/shared/network/remote/diohelper.dart';

import '../../models/add_to_cart_model.dart';
import '../../models/cat_d_model.dart';
import '../../models/cat_model.dart';
import '../../models/fav_model.dart';
import '../../models/home_model.dart';

class ShopCubit extends Cubit<ShopcubitStates> {
  ShopCubit() : super(ShopcubitInitial());
  static ShopCubit get(context) => BlocProvider.of(context);
  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavouritsScreen(),
    SettingsScreen(),
  ];
  var currentIndex = 0;

  void changBottom(index) {
    if (index == 1) getcart();
    currentIndex = index;
    emit(BottomBarChangeState());
  }

  HomeModel? homeModel;
  Map<int?, bool?> favorites = {};
  void getHomeData() {
    emit(LoadingHomeState());
    DioHelper.getData(
      token: token,
      url: HOME,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print('tokeennn=$token');
      for (var element in homeModel!.data!.products) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      }
      emit(LoadSuccessHomeState());
    }).catchError((error) {
      emit(LoadErrorHomeState());
      print(error.toString());
    });
  }

  CategoriesModel? categegoryModel;
  void getCategories() {
    DioHelper.getData(
      token: token,
      url: CATEGORIES,
    ).then((value) {
      categegoryModel = CategoriesModel.fromJson(value.data);
      emit(LoadSuccessCategoriesState());
    }).catchError((error) {
      emit(LoadErrorCategoriesState());
      print(error.toString());
    });
  }

  CategegoryDModel? categegoryDModel;
  void getCategoriesD(id) async {
    await DioHelper.getData(
      token: token,
      url: 'categories/$id',
    ).then((value) {
      categegoryDModel = CategegoryDModel.fromJson(value.data);
      emit(LoadSuccessCategoriesDState());
    }).catchError((error) {
      emit(LoadErrorCategoriesDState());
      print(error.toString());
    });
  }

  FavoritesModel? favoritesmodel;
  ChangeFavorites(productId) {
    favorites[productId] = !favorites[productId]!;
    emit(SuccessFavoritesState());
    DioHelper.postData(
      token: token,
      url: FAVORITES,
      data: {'product_id': productId},
    ).then((value) {
      favoritesmodel = FavoritesModel.fromJson(value.data);
      if (!favoritesmodel!.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getUserFavorites();
      }
      emit(LoadSuccessFavoritesState(favoritesmodel));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(LoadErrorFavoritesState());
      print(error);
    });
  }

  UserFavorites? userfavoritesmodel;
  void getUserFavorites() {
    emit(LoadUserFavoritesState());
    DioHelper.getData(
      token: token,
      url: FAVORITES,
    ).then((value) {
      userfavoritesmodel = UserFavorites.fromJson(value.data);
      emit(LoadSuccessUserFavoritesState());
    }).catchError((error) {
      emit(LoadErrorFavoritesState());
      print(error.toString());
    });
  }

  ShopLoginModel? usermodel;
  void getUserData() {
    emit(LoadingrUserDataState());
    DioHelper.getData(
      token: token,
      url: PROFILE,
    ).then((value) {
      usermodel = ShopLoginModel.fromJson(value.data);
      emit(LoadUserDataState(usermodel));
    }).catchError((error) {
      emit(LoadErrorUserDataState());
      print(error.toString());
    });
  }

  updateUserData({
    required name,
    required email,
    required phone,
  }) {
    emit(LoadingUserDataUpdate());
    DioHelper.putData(
      token: token,
      url: UPDATE,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      usermodel = ShopLoginModel.fromJson(value.data);
      emit(LoadUserDataUpdateState(usermodel));
    }).catchError((error) {
      emit(LoadErrorUserDataUpdateState());
      print(error.toString());
    });
  }

  AddToCart? cartmodel;
  void addToCart(id) async {
    emit(AddToCartLoading());
    await DioHelper.postData(
      data: {'product_id': id},
      token: token,
      url: CARTS,
    ).then((value) {
      cartmodel = AddToCart.fromJson(value.data);
      emit(AddToCartLoaded());
    }).catchError((error) {
      emit(AddToCartError(error));
      print(error.toString());
    });
  }

  GetCartModel? getcartmodel;
  void getcart() async {
    emit(GetCartLoading());
    await DioHelper.getData(
      token: token,
      url: CARTS,
    ).then((value) {
      getcartmodel = GetCartModel.fromJson(value.data);
      emit(GetCartLoaded());
    }).catchError((error) {
      emit(GetCartError(error));
      print(error.toString());
    });
  }
}
