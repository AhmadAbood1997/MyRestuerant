import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../repositories/product_repository.dart';

class DeleteProductUsecase {
  ProductRepository repoistory;
  DeleteProductUsecase(this.repoistory);

  Future<Either<Failure, Unit>> call(int productId) async {
    return await repoistory.deleteProduct(productId);
  }
}
