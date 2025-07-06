import 'dart:convert';

class ClientCreateRequest {
  final String name;
  final String lastName;
  final String email;
  final String phone;
  final String city;
  final String zipCode;
  final String street;
  final String houseNumber;

  ClientCreateRequest({
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.city,
    required this.zipCode,
    required this.street,
    required this.houseNumber,
  });

  factory ClientCreateRequest.fromRawJson(String str) =>
      ClientCreateRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClientCreateRequest.fromJson(Map<String, dynamic> json) =>
      ClientCreateRequest(
        name: json["name"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        city: json["city"],
        zipCode: json["zipCode"],
        street: json["street"],
        houseNumber: json["houseNumber"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "city": city,
        "zipCode": zipCode,
        "street": street,
        "houseNumber": houseNumber,
      };
}
