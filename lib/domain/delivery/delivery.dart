import 'package:ecommerce_web/domain/delivery/delivery_provider_key.dart';

import 'delivery_status.dart';

class Delivery {
  final DeliveryProviderKey deliveryProvider;
  final DeliveryStatus status;

  const Delivery({required this.deliveryProvider, required this.status});

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        deliveryProvider: DeliveryProviderKey(key: json["deliveryProvider"]),
        status: DeliveryStatus.fromString(json["status"])!,
      );

  Map<String, dynamic> toJson() => {
        "deliveryProvider": deliveryProvider.key,
        "status": status,
      };
}
