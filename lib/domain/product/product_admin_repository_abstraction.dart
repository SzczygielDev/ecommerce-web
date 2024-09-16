import 'package:ecommerce_web/domain/product/admin_product.dart';

import 'product_id.dart';

abstract class ProductAdminRepositoryAbstraction {
  Future<List<AdminProduct>> findAll();
  Future<AdminProduct?> findById(ProductId id);
}
