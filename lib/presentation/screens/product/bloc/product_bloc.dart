import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/cart/cart_repository_abstraction.dart';
import 'package:ecommerce_web/domain/product/product.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepositoryAbstraction productRepository;
  final CartRepositoryAbstraction cartRepository;
  ProductBloc({required this.productRepository, required this.cartRepository})
      : super(const ProductState()) {
    on<ProductOnLoadEvent>((event, emit) async {
      final foundProduct = await productRepository.findById(event.id);

      if (foundProduct == null) {
        emit(state.copyWith(loadingState: ProductLoadingState.error));
        return;
      }

      emit(state.copyWith(
          product: foundProduct, loadingState: ProductLoadingState.loaded));
    });

    on<ProductAddToCartEvent>((event, emit) async {
      final result = await cartRepository.addProductToCart(
          state.product!.id, event.quantity);
      emit(state.copyWith(showAddedToCartDialog: true));
    });

    on<AddedToCartOverlayShowedEvent>((event, emit) async {
      emit(state.copyWith(showAddedToCartDialog: false));
    });
  }
}