import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/product/product.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepositoryAbstraction productRepository;

  ProductBloc({required this.productRepository})
      : super(ProductLoadingState()) {
    on<ProductOnLoadEvent>((event, emit) async {
      final foundProduct = await productRepository.findById(event.id);

      if (foundProduct == null) {
        emit(ProductLoadingErrorState());
        return;
      }

      emit(ProductLoadedState(product: foundProduct));
    });
  }
}
