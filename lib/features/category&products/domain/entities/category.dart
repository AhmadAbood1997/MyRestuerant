import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int? categoryId;
  final String title;

  const Category({
    this.categoryId,
    required this.title,
  });

  @override
  List<Object?> get props => [categoryId, title];
}
