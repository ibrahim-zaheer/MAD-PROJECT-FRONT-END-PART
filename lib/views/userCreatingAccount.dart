// To parse this JSON data, do
//
//     final userCreation = userCreationFromJson(jsonString);

import 'dart:convert';

List<UserCreation> userCreationFromJson(String str) => List<UserCreation>.from(
    json.decode(str).map((x) => UserCreation.fromJson(x)));

String userCreationToJson(List<UserCreation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserCreation {
  String username;
  String password;
  String email;
  String phoneNumber;

  UserCreation({
    required this.username,
    required this.password,
    required this.email,
    required this.phoneNumber,
  });

  factory UserCreation.fromJson(Map<String, dynamic> json) => UserCreation(
        username: json["username"],
        password: json["password"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "phoneNumber": phoneNumber,
      };
}
