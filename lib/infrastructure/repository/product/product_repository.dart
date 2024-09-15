import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/product/product.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:ecommerce_web/infrastructure/repository/common/repository_base.dart';

import 'model/product_create_request.dart';
import 'model/product_update_request.dart';

class ProductRepository extends RepositoryBase
    implements ProductRepositoryAbstraction {
  final dio = locator.get<Dio>();
  @override
  Future<List<Product>> findAll() async {
    try {
      final response = await dio.get<List>("/products");

      var models = (response.data ?? [])
          .map(
            (e) => Product.fromJson(e),
          )
          .toList();

      return models;
    } on Exception catch (ex) {
      defaultErrorHandler(ex);
      return [];
    }
  }

  @override
  Future<Product?> findById(ProductId id) async {
    try {
      final response = await dio.get("/products/${id.value}");

      return Product.fromJson(response.data);
    } on Exception catch (ex) {
      defaultErrorHandler(ex);
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

      return Product.fromJson(response.data);
    } on Exception catch (ex) {
      defaultErrorHandler(ex);
      return null;
    }
  }

  @override
  Future<Product?> deleteProduct(ProductId id) async {
    try {
      final response = await dio.delete(
        "/products/${id.value}",
      );

      return Product.fromJson(response.data);
    } on Exception catch (ex) {
      defaultErrorHandler(ex);
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

      return Product.fromJson(response.data);
    } on Exception catch (ex) {
      defaultErrorHandler(ex);
      return null;
    }
  }
}
