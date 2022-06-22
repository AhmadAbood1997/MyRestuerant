import 'package:equatable/equatable.dart';

class Product extends Equatable {
  int? productId;
  int categoryId;
  String title;
  int rate;
  String period;
  String level;

  Product({
    this.productId,
    required this.categoryId,
    required this.title,
    required this.rate,
    required this.period,
    required this.level,
  });

  @override
  List<Object?> get props =>
      [productId, categoryId, title, rate, period, level];

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['categoryId'] = categoryId;
    map['level'] = level;
    map['period'] = period;
    map['rate'] = rate;
    map['title'] = title;
    map['productId'] = productId;
    return map;
  }
}
