import 'package:dartz/dartz.dart';
import 'package:my_resturant/features/category&products/data/models/product_model.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/product.dart';
import '../../repositories/product_repository.dart';

class UpdateProductUsecase {
  ProductRepository repository;
  UpdateProductUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Product product) async {
    return await repository.updateProduct(product);
  }
}
