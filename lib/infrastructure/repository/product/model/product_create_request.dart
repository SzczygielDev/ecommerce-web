class ProductCreateRequest {
  final String? title;
  final String? description;
  final double? price;
  final String? imageId;

  ProductCreateRequest({
    required this.title,
    required this.description,
    required this.price,
    required this.imageId,
  });

  factory ProductCreateRequest.fromJson(Map<String, dynamic> json) =>
      ProductCreateRequest(
          title: json["title"],
          description: json["description"],
          price: json["price"],
          imageId: json["imageId"]);

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "price": price,
        "imageId": imageId
      };
}
