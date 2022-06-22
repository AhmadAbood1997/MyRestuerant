import 'package:my_resturant/features/category&products/data/datasources/product/product_local_data_source.dart';
import 'package:my_resturant/features/category&products/data/datasources/product/product_remote_data_source.dart';
import 'package:my_resturant/features/category&products/data/repositories/product_repository_impl.dart';
import 'package:my_resturant/features/category&products/domain/repositories/product_repository.dart';
import 'package:my_resturant/features/category&products/domain/usecases/product/add_product.dart';
import 'package:my_resturant/features/category&products/domain/usecases/product/delete_product.dart';
import 'package:my_resturant/features/category&products/domain/usecases/product/get_all_products.dart';
import 'package:my_resturant/features/category&products/domain/usecases/product/update_product.dart';
import 'package:my_resturant/features/category&products/presentation/bloc/product/product_bloc.dart';

import 'core/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => ProductsBloc(getAllProducts: sl()));

// Usecases

  sl.registerLazySingleton(() => GetAllProductsUsecase(sl()));
  sl.registerLazySingleton(() => AddProductUsecase(sl()));
  sl.registerLazySingleton(() => DeleteProductUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProductUsecase(sl()));

// Repository

  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

// Datasources

  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl());
  sl.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl());

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
