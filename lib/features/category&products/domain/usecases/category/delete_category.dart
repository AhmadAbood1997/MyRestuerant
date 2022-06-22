import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../entities/category.dart';
import '../../entities/product.dart';
import '../../repositories/category_repository.dart';
import '../../repositories/product_repository.dart';

class DeleteCategoryUsecase {
  final CategoryRepository repository;
  DeleteCategoryUsecase(this.repository);
  Future<Either<Failure, Unit>> call(int categoryId) async {
    return await repository.deleteCategory(categoryId);
  }
}
