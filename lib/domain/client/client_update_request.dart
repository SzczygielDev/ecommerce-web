import 'dart:convert';

class ClientUpdateRequest {
  final String name;
  final String lastName;
  final String phone;
  final String city;
  final String zipCode;
  final String street;
  final String houseNumber;

  ClientUpdateRequest({
    required this.name,
    required this.lastName,
    required this.phone,
    required this.city,
    required this.zipCode,
    required this.street,
    required this.houseNumber,
  });

  factory ClientUpdateRequest.fromRawJson(String str) =>
      ClientUpdateRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClientUpdateRequest.fromJson(Map<String, dynamic> json) =>
      ClientUpdateRequest(
        name: json["name"],
        lastName: json["lastName"],
        phone: json["phone"],
        city: json["city"],
        zipCode: json["zipCode"],
        street: json["street"],
        houseNumber: json["houseNumber"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastName": lastName,
        "phone": phone,
        "city": city,
        "zipCode": zipCode,
        "street": street,
        "houseNumber": houseNumber,
      };
}
