part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductState {
  final Product product;

  const ProductLoadedState({required this.product});

  ProductLoadedState copyWith({Product? product}) {
    return ProductLoadedState(product: product ?? this.product);
  }

  @override
  List<Object?> get props => [product];
}

class ProductLoadingState extends ProductState {}

class ProductLoadingErrorState extends ProductState {}
