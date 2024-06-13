import 'package:ecommerce_web/domain/product/product.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:ecommerce_web/infrastructure/common/exceptions/mapper_exception.dart';
import 'package:ecommerce_web/infrastructure/repository/product/model/product_dto.dart';

extension ProductMapper on ProductDto {
  Product toModel() {
    final productId = this.productId;
    final title = this.title;
    final description = this.description;
    final price = this.price;

    if (productId == null ||
        title == null ||
        description == null ||
        price == null) {
      throw MappingException(
          "Mapping failed for type Product, provided values: productId='$productId' title='$title' description='$description' price='$price'");
    }

    return Product(
        id: ProductId(productId),
        description: description,
        title: title,
        price: price);
  }
}
