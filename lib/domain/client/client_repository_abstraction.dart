import 'package:ecommerce_web/domain/client/client.dart';

abstract class ClientRepositoryAbstraction {
  Future<Client?> getCurrentClient();
  Future<bool> createClient(
    String name,
    String lastName,
    String email,
    String phone,
    String city,
    String zipCode,
    String street,
    String houseNumber,
  );
}
