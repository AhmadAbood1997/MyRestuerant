part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetAllPostsEvent extends ProductEvent {}

class RefreshPostsEvent extends ProductEvent {}
