import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/product/admin_product.dart';
import 'package:ecommerce_web/domain/product/product_admin_repository_abstraction.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:equatable/equatable.dart';

part 'product_price_history_state.dart';

class ProductPriceHistoryCubit extends Cubit<ProductPriceHistoryState> {
  final ProductAdminRepositoryAbstraction productAdminRepository;
  ProductPriceHistoryCubit({required this.productAdminRepository})
      : super(const ProductPriceHistoryState());

  Future load(ProductId productId) async {
    final product = await productAdminRepository.findById(productId);

    if (product == null) {
      emit(const ProductPriceHistoryState(
          loadingState: ProductPriceHistoryLoadingState.error));
    }

    emit(ProductPriceHistoryState(
        loadingState: ProductPriceHistoryLoadingState.loaded,
        product: product));
  }
}
