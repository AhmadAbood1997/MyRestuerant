import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getAllCategory();
  Future<Either<Failure, Unit>> addCategory(Category category);
  Future<Either<Failure, Unit>> updateCategory(Category category);
  Future<Either<Failure, Unit>> deleteCategory(int id);
}
