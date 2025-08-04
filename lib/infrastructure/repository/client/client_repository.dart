import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/client/client.dart';
import 'package:ecommerce_web/domain/client/client_create_request.dart';
import 'package:ecommerce_web/domain/client/client_repository_abstraction.dart';
import 'package:ecommerce_web/domain/client/client_update_request.dart';
import 'package:ecommerce_web/infrastructure/repository/common/repository_base.dart';

class ClientRepository extends RepositoryBase
    implements ClientRepositoryAbstraction {
  final dio = locator.get<Dio>();

  @override
  Future<bool> createClient(String name, String lastName, String phone,
      String city, String zipCode, String street, String houseNumber) async {
    try {
      final response = await dio.post("/clients",
          data: ClientCreateRequest(
                  name: name,
                  lastName: lastName,
                  phone: phone,
                  city: city,
                  zipCode: zipCode,
                  street: street,
                  houseNumber: houseNumber)
              .toJson());

      return response.statusCode == 201;
    } on Exception catch (e) {
      defaultErrorHandler(e);
      return false;
    }
  }

  @override
  Future<Client?> getCurrentClient() async {
    try {
      final response = await dio.get("/clients");

      var client = Client.fromJson(response.data);

      return client;
    } on Exception catch (e) {
      defaultErrorHandler(e);
      return null;
    }
  }

  @override
  Future<Client?> updateClient(String name, String lastName, String phone,
      String city, String zipCode, String street, String houseNumber) async {
    try {
      final response = await dio.put("/clients",
          data: ClientUpdateRequest(
                  name: name,
                  lastName: lastName,
                  phone: phone,
                  city: city,
                  zipCode: zipCode,
                  street: street,
                  houseNumber: houseNumber)
              .toJson());

      return Client.fromJson(response.data);
    } on Exception catch (e) {
      defaultErrorHandler(e);
      return null;
    }
  }
}
