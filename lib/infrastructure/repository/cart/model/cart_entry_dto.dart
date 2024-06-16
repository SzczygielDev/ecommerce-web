import 'dart:convert';

class CartEntryDto {
  final String productId;
  final int quantity;

  CartEntryDto({
    required this.productId,
    required this.quantity,
  });

  factory CartEntryDto.fromRawJson(String str) =>
      CartEntryDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartEntryDto.fromJson(Map<String, dynamic> json) => CartEntryDto(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
