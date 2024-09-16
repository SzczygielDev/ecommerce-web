import 'package:ecommerce_web/domain/payment/payment_service_providers.dart';

import 'payment_service_provider_key.dart';

class PaymentServiceProvider {
  final PaymentServiceProviderKey key;
  final String displayName;
  final Uri logoUrl;

  PaymentServiceProvider(
      {required this.key, required this.displayName, required String logoUrl})
      : logoUrl = Uri.parse(logoUrl);

  PaymentServiceProvider.fromJson(Map<String, dynamic> json)
      : this(
            key: PaymentServiceProviderKey(key: json['paymentServiceProvider']),
            displayName: json['displayName'],
            logoUrl: json['logoUrl']);

  PaymentServiceProviders? get mappedPSP =>
      PaymentServiceProviders.fromString(key.key);
}
