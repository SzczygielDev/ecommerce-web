part of 'product_bloc.dart';

enum ProductLoadingState { loading, loaded, error }

class ProductState extends Equatable {
  final Product? product;
  final bool showAddedToCartDialog;
  final ProductLoadingState loadingState;
  final bool isUserAdmin;
  const ProductState(
      {this.product,
      this.showAddedToCartDialog = false,
      this.loadingState = ProductLoadingState.loading,
      this.isUserAdmin = false});

  ProductState copyWith(
      {Product? product,
      bool? showAddedToCartDialog,
      ProductLoadingState? loadingState,
      bool? isUserAdmin}) {
    return ProductState(
        product: product ?? this.product,
        loadingState: loadingState ?? this.loadingState,
        showAddedToCartDialog:
            showAddedToCartDialog ?? this.showAddedToCartDialog,
        isUserAdmin: isUserAdmin ?? this.isUserAdmin);
  }

  @override
  List<Object?> get props =>
      [product, showAddedToCartDialog, loadingState, isUserAdmin];
}
