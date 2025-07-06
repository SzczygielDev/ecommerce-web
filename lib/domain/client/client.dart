import 'dart:convert';

class Client {
  final String id;
  final String name;
  final String lastName;
  final String email;
  final String phone;
  final String accountType;
  final String city;
  final String zipCode;
  final String street;
  final String houseNumber;

  Client({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.accountType,
    required this.city,
    required this.zipCode,
    required this.street,
    required this.houseNumber,
  });

  factory Client.fromRawJson(String str) => Client.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        accountType: json["accountType"],
        city: json["city"],
        zipCode: json["zipCode"],
        street: json["street"],
        houseNumber: json["houseNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "accountType": accountType,
        "city": city,
        "zipCode": zipCode,
        "street": street,
        "houseNumber": houseNumber,
      };
}
