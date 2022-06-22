import 'package:dartz/dartz.dart';
import '../../models/product_model.dart';

import '../../../../../core/db.dart';
import '../../../domain/entities/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getAllProducts();
  Future<Unit> deleteProduct(int productId);
  Future<Unit> updateProduct(ProductModel product);
  Future<Unit> addProduct(ProductModel product);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  BDataHelper bDataHelper = BDataHelper();

  @override
  Future<Unit> addProduct(ProductModel product) {
    bDataHelper.insertProduct(product);
    throw UnimplementedError();
  }

  @override
  Future<Unit> deleteProduct(int productId) {
    bDataHelper.deleteProduct(productId.toString());
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getAllProducts() async {
    return bDataHelper.getProductList();
  }

  @override
  Future<Unit> updateProduct(ProductModel product) {
    bDataHelper.updateProduct(product);
    throw UnimplementedError();
  }
}
