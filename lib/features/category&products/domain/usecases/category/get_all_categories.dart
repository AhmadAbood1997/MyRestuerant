import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/category.dart';
import '../../repositories/category_repository.dart';

class GetAllCategoriesUsecase {
  CategoryRepository repository;
  GetAllCategoriesUsecase(this.repository);

  Future<Either<Failure, List<Category>>> call() async {
    return await repository.getAllCategory();
  }
}
