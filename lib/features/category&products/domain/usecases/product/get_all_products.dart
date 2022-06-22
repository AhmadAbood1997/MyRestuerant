import 'package:dartz/dartz.dart';
import 'package:my_resturant/features/category&products/data/models/product_model.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/product.dart';
import '../../repositories/product_repository.dart';

class GetAllProductsUsecase {
  ProductRepository repository;
  GetAllProductsUsecase(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getAllProduct();
  }
}
