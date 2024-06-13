part of 'catalog_bloc.dart';

enum ProductLoadingState { idle, inProgress }

@immutable
class CatalogState extends Equatable {
  final List<Product> products;
  final ProductLoadingState productsLoadingState;

  const CatalogState(
      {this.products = const [],
      this.productsLoadingState = ProductLoadingState.inProgress});

  CatalogState copyWith(
      {List<Product>? products, ProductLoadingState? productsLoadingState}) {
    return CatalogState(
        products: products ?? this.products,
        productsLoadingState:
            productsLoadingState ?? this.productsLoadingState);
  }

  @override
  List<Object?> get props => [products, productsLoadingState];
}
