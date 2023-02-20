import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/searchcubit/search_state.dart';

import 'package:shop_app/models/searchproducts.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/endpoints.dart';
import 'package:shop_app/shared/network/remote/diohelper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);
  searchProducts? model;
  searchData({
    required text,
  }) {
    emit(LoadingSearchState());
    DioHelper.postData(
      token: token,
      url: SEARCH,
      data: {
        'text': text,
      },
    ).then((value) {
      model = searchProducts.fromJson(value.data);
      emit(SearchLoadState(model));
    }).catchError((error) {
      emit(SearchErrorState());
      print(error.toString());
    });
  }
}
