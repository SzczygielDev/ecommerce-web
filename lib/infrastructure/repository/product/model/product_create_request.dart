class ProductCreateRequest {
  final String? title;
  final String? description;
  final double? price;

  ProductCreateRequest({
    required this.title,
    required this.description,
    required this.price,
  });

  factory ProductCreateRequest.fromJson(Map<String, dynamic> json) =>
      ProductCreateRequest(
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
