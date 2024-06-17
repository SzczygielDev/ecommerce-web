class ProductDto {
  final String? productId;
  final String? title;
  final String? description;
  final double? price;

  ProductDto({
    required this.productId,
    required this.title,
    required this.description,
    required this.price,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
        productId: json["productId"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "title": title,
        "description": description,
        "price": price,
      };
}
