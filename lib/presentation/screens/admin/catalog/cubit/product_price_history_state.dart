part of 'product_price_history_cubit.dart';

enum ProductPriceHistoryLoadingState { loading, loaded, error }

class ProductPriceHistoryState extends Equatable {
  final ProductPriceHistoryLoadingState loadingState;
  final AdminProduct? product;

  const ProductPriceHistoryState(
      {this.loadingState = ProductPriceHistoryLoadingState.loading,
      this.product});

  @override
  List<Object?> get props => [loadingState, product];
}
