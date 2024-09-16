import 'package:ecommerce_web/domain/delivery/delivery_provider_key.dart';

class DeliveryProvider {
  final DeliveryProviderKey key;
  final String displayName;
  final Uri logoUrl;

  DeliveryProvider(
      {required this.key, required this.displayName, required String logoUrl})
      : logoUrl = Uri.parse(logoUrl);

  DeliveryProvider.fromJson(Map<String, dynamic> json)
      : this(
            key: DeliveryProviderKey(key: json['deliveryProvider']),
            displayName: json['displayName'],
            logoUrl: json['logoUrl']);
}
