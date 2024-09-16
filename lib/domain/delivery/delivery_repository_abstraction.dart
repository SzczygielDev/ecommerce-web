import 'package:ecommerce_web/domain/delivery/delivery_provider.dart';

abstract class DeliveryRepositoryAbstraction {
  Future<List<DeliveryProvider>> getDeliveryProviders();
}
