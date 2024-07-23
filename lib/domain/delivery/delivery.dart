import 'delivery_status.dart';

class Delivery {
  final String deliveryProvider;
  final DeliveryStatus status;

  const Delivery({required this.deliveryProvider, required this.status});

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        deliveryProvider: json["deliveryProvider"],
        status: DeliveryStatus.fromString(json["status"])!,
      );

  Map<String, dynamic> toJson() => {
        "deliveryProvider": deliveryProvider,
        "status": status,
      };
}
