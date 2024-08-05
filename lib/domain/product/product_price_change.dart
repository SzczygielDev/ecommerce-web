class ProductPriceChange {
  final double newPrice;
  final DateTime timestamp;
  const ProductPriceChange({required this.newPrice, required this.timestamp});

  factory ProductPriceChange.fromJson(Map<String, dynamic> json) =>
      ProductPriceChange(
        newPrice: json["newPrice"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "newPrice": newPrice,
        "timestamp": timestamp,
      };
}
