import 'package:dartz/dartz.dart';

import '../../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCachedProducts();
  Future<Unit> cacheProducts(List<ProductModel> postModels);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  @override
  Future<Unit> cacheProducts(List<ProductModel> postModels) {
    // TODO: implement cacheProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getCachedProducts() {
    // TODO: implement getCachedProducts
    throw UnimplementedError();
  }
}
