import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/product/product.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:equatable/equatable.dart';

part 'admin_catalog_event.dart';
part 'admin_catalog_state.dart';

class AdminCatalogBloc extends Bloc<AdminCatalogEvent, AdminCatalogState> {
  final ProductRepositoryAbstraction productRepository;
  AdminCatalogBloc({required this.productRepository})
      : super(const AdminCatalogState(products: [])) {
    on<AdminCatalogOnLoadEvent>((event, emit) async {
      final products = await productRepository.findAll();

      emit(state.copyWith(products: products));
    });

    on<AdminCatalogCreateProductEvent>((event, emit) async {
      final result = await productRepository.createProduct(
          event.title, event.description, event.price);

      if (result != null) {
        final products = await productRepository.findAll();
        emit(state.copyWith(products: products));
      }
    });

    on<AdminCatalogDeleteProductEvent>((event, emit) async {
      final result = await productRepository.deleteProduct(event.productId);

      if (result != null) {
        final products = await productRepository.findAll();
        emit(state.copyWith(products: products));
      }
    });

    on<AdminCatalogUpdateProductEvent>((event, emit) async {
      final updatedProduct = event.updatedProduct;
      final result =
          await productRepository.update(updatedProduct.id, updatedProduct);

      if (result != null) {
        final products = await productRepository.findAll();
        emit(state.copyWith(products: products));
      }
    });
  }
}
