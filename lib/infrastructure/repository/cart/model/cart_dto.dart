import 'dart:convert';

import 'cart_entry_dto.dart';

class CartDto {
  final String cartId;
  final String status;
  final List<CartEntryDto> products;
  final double total;

  CartDto({
    required this.cartId,
    required this.status,
    required this.products,
    required this.total,
  });

  factory CartDto.fromRawJson(String str) => CartDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartDto.fromJson(Map<String, dynamic> json) => CartDto(
        cartId: json["cartId"],
        status: json["status"],
        products: List<CartEntryDto>.from(
            json["products"].map((x) => CartEntryDto.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "cartId": cartId,
        "status": status,
        "products": List<dynamic>.from((products ?? []).map((x) => x.toJson())),
        "total": total,
      };
}
