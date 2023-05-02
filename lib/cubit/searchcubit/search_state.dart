import 'package:shop_app/models/searchproducts.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchErrorState extends SearchStates {}

class SearchLoadState extends SearchStates {
  final searchProducts? model;

  SearchLoadState(this.model);
}

class LoadingSearchState extends SearchStates {}
