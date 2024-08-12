class OrderCompletePackingRequest {
  final double width;
  final double length;
  final double height;
  final double weight;

  OrderCompletePackingRequest({
    required this.width,
    required this.length,
    required this.height,
    required this.weight,
  });

  factory OrderCompletePackingRequest.fromJson(Map<String, dynamic> json) =>
      OrderCompletePackingRequest(
        width: json["width"],
        length: json["length"],
        height: json["height"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "length": length,
        "height": height,
        "weight": weight,
      };
}
