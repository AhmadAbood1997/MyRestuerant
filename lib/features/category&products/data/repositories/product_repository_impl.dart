import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../datasources/product/product_remote_data_source.dart';
import '../models/product_model.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

import '../../../../core/db.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/product/product_local_data_source.dart';

typedef Future<Unit> DeleteOrUpdateOrAddPost();

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  BDataHelper bDataHelper = BDataHelper();
  final NetworkInfo networkInfo;

  ProductRepositoryImpl(
      {required this.remoteDataSource,
      required this.networkInfo,
      required this.localDataSource});

  @override
  Future<Either<Failure, Unit>> addProduct(Product product) async {
    final ProductModel productModel = ProductModel(
        categoryId: product.categoryId,
        title: product.title,
        rate: product.rate,
        period: product.period,
        level: product.level);

    return await _getMessage(() {
      return remoteDataSource.addProduct(productModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(int id) async {
    return await _getMessage(() {
      return remoteDataSource.deleteProduct(id);
    });
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProduct() async {
    try {
      final remoteProduct = await remoteDataSource.getAllProducts();
      return Right(remoteProduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateProduct(Product product) async {
    final ProductModel productModel = ProductModel(
        categoryId: product.categoryId,
        title: product.title,
        rate: product.rate,
        period: product.period,
        level: product.level);

    return await _getMessage(() {
      return remoteDataSource.updateProduct(productModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
      DeleteOrUpdateOrAddPost deleteOrUpdateOrAddPost) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddPost();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
