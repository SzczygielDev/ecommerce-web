class CartSubmitRequest {
  final String deliveryProvider;
  final String paymentServiceProvider;

  CartSubmitRequest({
    required this.deliveryProvider,
    required this.paymentServiceProvider,
  });

  factory CartSubmitRequest.fromJson(Map<String, dynamic> json) =>
      CartSubmitRequest(
        deliveryProvider: json["deliveryProvider"],
        paymentServiceProvider: json["paymentServiceProvider"],
      );

  Map<String, dynamic> toJson() => {
        "deliveryProvider": deliveryProvider,
        "paymentServiceProvider": paymentServiceProvider,
      };
}
