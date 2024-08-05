import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/product/admin_product.dart';
import 'package:ecommerce_web/domain/product/product_admin_repository_abstraction.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';

class ProductAdminRepository extends ProductAdminRepositoryAbstraction {
  final dio = locator.get<Dio>();
  @override
  Future<List<AdminProduct>> findAll() async {
    try {
      final response = await dio.get<List>("/admin/products");

      var models = (response.data ?? [])
          .map(
            (e) => AdminProduct.fromJson(e),
          )
          .toList();

      return models;
    } on Exception catch (ex) {
      return [];
    }
  }

  @override
  Future<AdminProduct?> findById(ProductId id) async {
    try {
      final response = await dio.get("/admin/products/${id.value}");

      return AdminProduct.fromJson(response.data);
    } on Exception catch (ex) {
      return null;
    }
  }
}
