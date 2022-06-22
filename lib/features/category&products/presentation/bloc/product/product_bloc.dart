import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_resturant/features/category&products/data/models/product_model.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/product/get_all_products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductsBloc extends Bloc<ProductEvent, ProductsState> {
  final GetAllProductsUsecase getAllProducts;

  ProductsBloc({required this.getAllProducts}) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        emit(LoadingProductsState());
        final failureOrProducts = await getAllProducts();
        emit(_mapFailureOrProductsToState(failureOrProducts));
      }
    });
  }

  ProductsState _mapFailureOrProductsToState(
      Either<Failure, List<Product>> either) {
    return either.fold(
      (failure) => ErrorProductsState(message: _mapFailureToMessage(failure)),
      (products) => LoadedProductsState(
        products: products,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
