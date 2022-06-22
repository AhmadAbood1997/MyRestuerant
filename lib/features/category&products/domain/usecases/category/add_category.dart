import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../entities/category.dart';
import '../../entities/product.dart';
import '../../repositories/category_repository.dart';
import '../../repositories/product_repository.dart';

class AddCategoryUsecase {
  final CategoryRepository repository;
  AddCategoryUsecase(this.repository);
  Future<Either<Failure, Unit>> call(Category category) async {
    return await repository.addCategory(category);
  }
}
