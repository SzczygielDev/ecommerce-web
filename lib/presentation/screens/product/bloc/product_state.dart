part of 'product_bloc.dart';

enum ProductLoadingState { loading, loaded, error }

class ProductState extends Equatable {
  final Product? product;
  final bool showAddedToCartDialog;
  final ProductLoadingState loadingState;
  const ProductState(
      {this.product,
      this.showAddedToCartDialog = false,
      this.loadingState = ProductLoadingState.loading});

  ProductState copyWith(
      {Product? product,
      bool? showAddedToCartDialog,
      ProductLoadingState? loadingState}) {
    return ProductState(
        product: product ?? this.product,
        loadingState: loadingState ?? this.loadingState,
        showAddedToCartDialog:
            showAddedToCartDialog ?? this.showAddedToCartDialog);
  }

  @override
  List<Object?> get props => [product, showAddedToCartDialog, loadingState];
}
