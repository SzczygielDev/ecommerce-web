class ProductUpdateRequest {
  final String? title;
  final String? description;
  final double? price;

  ProductUpdateRequest({
    required this.title,
    required this.description,
    required this.price,
  });

  factory ProductUpdateRequest.fromJson(Map<String, dynamic> json) =>
      ProductUpdateRequest(
        title: json["title"],
        description: json["description"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "price": price,
      };
}
