import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/product/product.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:ecommerce_web/infrastructure/repository/product/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final ProductRepositoryAbstraction productRepository;
  CatalogBloc({required this.productRepository}) : super(const CatalogState()) {
    on<CatalogOnLoadEvent>(
      (event, emit) async {
        var products = await productRepository.findAll();

        emit(state.copyWith(
            products: products,
            productsLoadingState: ProductLoadingState.idle));
      },
    );
  }
}
