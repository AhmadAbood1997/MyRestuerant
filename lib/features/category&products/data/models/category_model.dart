import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';

class CategoryModel extends Category {
  const CategoryModel({
    int? categoryId,
    required String title,
  }) : super(
          categoryId: categoryId,
          title: title,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['categoryId'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'title': title,
    };
  }
}
