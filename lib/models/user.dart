// // To parse this JSON data, do
// //
// //     final user = userFromJson(jsonString);

// import 'dart:convert';

// List<User> userFromJson(String str) =>
//     List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

// String userToJson(List<User> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class User {
//   int? id;
//   String? username;
//   String? password;
//   String? email;
//   String? phoneNumber;

//   User({
//     required this.id,
//     required this.username,
//     required this.password,
//     required this.email,
//     required this.phoneNumber,
//   });

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         username: json["username"],
//         password: json["password"],
//         email: json["email"],
//         phoneNumber: json["phoneNumber"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "username": username,
//         "password": password,
//         "email": email,
//         "phoneNumber": phoneNumber,
//       };
// }

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  int id;
  String username;
  String password;
  String email;
  String phoneNumber;
  String role;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "email": email,
        "phoneNumber": phoneNumber,
        "role": role,
      };
}
