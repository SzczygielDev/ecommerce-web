part of 'catalog_bloc.dart';

enum ProductsLoadingState { idle, inProgress }

@immutable
class CatalogState extends Equatable {
  final List<Product> products;
  final ProductsLoadingState productsLoadingState;

  const CatalogState(
      {this.products = const [],
      this.productsLoadingState = ProductsLoadingState.inProgress});

  CatalogState copyWith(
      {List<Product>? products, ProductsLoadingState? productsLoadingState}) {
    return CatalogState(
        products: products ?? this.products,
        productsLoadingState:
            productsLoadingState ?? this.productsLoadingState);
  }

  @override
  List<Object?> get props => [products, productsLoadingState];
}
