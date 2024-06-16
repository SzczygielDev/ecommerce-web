import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/product/product.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:ecommerce_web/infrastructure/repository/product/mapper/product_mapper.dart';
import 'package:ecommerce_web/infrastructure/repository/product/model/product_dto.dart';

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
}