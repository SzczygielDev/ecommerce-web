import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/delivery/delivery_provider.dart';
import 'package:ecommerce_web/domain/delivery/delivery_repository_abstraction.dart';

class DeliveryRepository extends DeliveryRepositoryAbstraction {
  final dio = locator.get<Dio>();
  @override
  Future<List<DeliveryProvider>> getDeliveryProviders() async {
    try {
      final response = await dio.get<List>("/delivery/providers");

      var models = (response.data ?? [])
          .map(
            (e) => DeliveryProvider.fromJson(e),
          )
          .toList();

      return models;
    } on Exception catch (ex) {
      return [];
    }
  }
}
