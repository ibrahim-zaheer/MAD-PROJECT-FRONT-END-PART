// To parse this JSON data, do
//
//     final singleUser = singleUserFromJson(jsonString);

import 'dart:convert';

SingleUser singleUserFromJson(String str) =>
    SingleUser.fromJson(json.decode(str));

String singleUserToJson(SingleUser data) => json.encode(data.toJson());

class SingleUser {
  int id;
  String username;
  String email;
  String phoneNumber;
  String role;

  SingleUser({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });

  factory SingleUser.fromJson(Map<String, dynamic> json) => SingleUser(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phoneNumber": phoneNumber,
        "role": role,
      };
}
