class AddItemToCartRequest {
  final String productId;
  final int quantity;

  AddItemToCartRequest({
    required this.productId,
    required this.quantity,
  });

  factory AddItemToCartRequest.fromJson(Map<String, dynamic> json) =>
      AddItemToCartRequest(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
