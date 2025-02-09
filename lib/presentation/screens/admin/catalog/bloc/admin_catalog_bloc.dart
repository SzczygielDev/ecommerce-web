import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/image/image_repository_abstraction.dart';
import 'package:ecommerce_web/domain/product/product.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'admin_catalog_event.dart';
part 'admin_catalog_state.dart';

class AdminCatalogBloc extends Bloc<AdminCatalogEvent, AdminCatalogState> {
  final ProductRepositoryAbstraction productRepository;
  final ImageRepositoryAbstraction imageRepository;
  final Logger logger;
  AdminCatalogBloc(
      {required this.productRepository,
      required this.imageRepository,
      required this.logger})
      : super(const AdminCatalogState(products: [])) {
    on<AdminCatalogOnLoadEvent>((event, emit) async {
      final products = await productRepository.findAll();

      emit(state.copyWith(products: products));
    });

    on<AdminCatalogCreateProductEvent>((event, emit) async {
      final imageId =
          await imageRepository.uploadImage(event.bytes, event.fileName);

      if (imageId == null) {
        logger.e("Failed to upload image!");
        return;
      }

      final result = await productRepository.createProduct(
          event.title, event.description, event.price, imageId);

      if (result != null) {
        final products = await productRepository.findAll();
        emit(state.copyWith(products: products));
      }
    });

    on<AdminCatalogDeleteProductEvent>((event, emit) async {
      final success = await productRepository.deleteProduct(event.productId);

      if (success) {
        final products = await productRepository.findAll();
        emit(state.copyWith(products: products));
      }
    });

    on<AdminCatalogUpdateProductEvent>((event, emit) async {
      var updatedProduct = event.updatedProduct;
      final updatedImage = event.updatedImage;
      final fileName = event.fileName;
      if (updatedImage != null && fileName != null) {
        logger.i("Updating image for product='${updatedProduct.id.value}'");
        final imageId =
            await imageRepository.uploadImage(updatedImage, fileName);

        if (imageId == null) {
          logger.e("Failed to upload image!");
          return;
        }
        logger.i(
            "Image id='${imageId.value}' for product='${updatedProduct.id.value}'");
        updatedProduct = updatedProduct.copyWith(imageId: imageId);
      }

      final result =
          await productRepository.update(updatedProduct.id, updatedProduct);

      if (result != null) {
        final products = await productRepository.findAll();
        emit(state.copyWith(products: products));
      }
    });
  }
}
