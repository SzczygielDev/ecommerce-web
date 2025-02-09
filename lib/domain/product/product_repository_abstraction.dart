import 'package:ecommerce_web/domain/image/image_id.dart';
import 'package:ecommerce_web/domain/product/product.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';

abstract class ProductRepositoryAbstraction {
  Future<List<Product>> findAll();
  Future<Product?> findById(ProductId id);
  Future<Product?> createProduct(
      String title, String description, double price, ImageId imageId);
  Future<bool> deleteProduct(ProductId id);
  Future<Product?> update(ProductId id, Product product);
}
