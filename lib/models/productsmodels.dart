class ProductsModelData {
  bool? statues;
  ProductModel? data;
  ProductsModelData.fromJson(Map<String, dynamic> json) {
    statues = json['statues'];
    data = ProductModel.fromJson(json['data']);
  }
}

class ProductModel {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  bool? inFavorites;
  bool? inCart;
  String? images;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
    images = json['images'];
    description = json['description'];
  }
}
