import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    int? productId,
    required int categoryId,
    required String title,
    required int rate,
    required String period,
    required String level,
  }) : super(
            categoryId: categoryId,
            level: level,
            period: period,
            rate: rate,
            title: title,
            productId: productId);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        categoryId: json['categoryId'],
        level: json['level'],
        period: json['period'],
        rate: json['rate'],
        title: json['title'],
        productId: json['productId']);
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'level': level,
      'period': period,
      'rate': rate,
      'title': title,
      'productId': productId
    };
  }
}
