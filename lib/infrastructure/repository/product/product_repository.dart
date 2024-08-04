import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/product/product.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:ecommerce_web/infrastructure/repository/product/mapper/product_mapper.dart';
import 'package:ecommerce_web/infrastructure/repository/product/model/product_dto.dart';

import 'model/product_create_request.dart';
import 'model/product_update_request.dart';

class ProductRepository extends ProductRepositoryAbstraction {
  final dio = locator.get<Dio>();
  @override
  Future<List<Product>> findAll() async {
    try {
      final response = await dio.get<List>("/products");

      var dtos = (response.data ?? [])
          .map(
            (e) => ProductDto.fromJson(e),
          )
          .toList();

      var models = dtos
          .map(
            (e) => e.toModel(),
          )
          .toList();

      return models;
    } on Exception catch (ex) {
      return [];
    }
  }

  @override
  Future<Product?> findById(ProductId id) async {
    try {
      final response = await dio.get("/products/${id.value}");

      return ProductDto.fromJson(response.data).toModel();
    } on Exception catch (ex) {
      return null;
    }
  }

  @override
  Future<Product?> createProduct(
      String title, String description, double price) async {
    try {
      final response = await dio.post("/products",
          data: ProductCreateRequest(
                  title: title, description: description, price: price)
              .toJson());

      return ProductDto.fromJson(response.data).toModel();
    } on Exception catch (ex) {
      return null;
    }
  }

  @override
  Future<Product?> deleteProduct(ProductId id) async {
    try {
      final response = await dio.delete(
        "/products/${id.value}",
      );

      return ProductDto.fromJson(response.data).toModel();
    } on Exception catch (ex) {
      return null;
    }
  }

  @override
  Future<Product?> update(ProductId id, Product product) async {
    try {
      final response = await dio.put("/products/${id.value}",
          data: ProductUpdateRequest(
                  title: product.title,
                  description: product.description,
                  price: product.price)
              .toJson());

      return ProductDto.fromJson(response.data).toModel();
    } on Exception catch (ex) {
      return null;
    }
  }
}
