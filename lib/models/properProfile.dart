// To parse this JSON data, do
//
//     final properProfile = properProfileFromJson(jsonString);

import 'dart:convert';

ProperProfile properProfileFromJson(String str) =>
    ProperProfile.fromJson(json.decode(str));

String properProfileToJson(ProperProfile data) => json.encode(data.toJson());

class ProperProfile {
  int id;
  int userId;
  String username;
  String password;
  String email;
  String phoneNumber;
  String role;
  DateTime dateOfBirth;
  String city;
  String country;
  int postalCode;
  String latestJob;
  String salaryIncomeAllowance;
  String isMarried;
  String cnicNumber;

  ProperProfile({
    required this.id,
    required this.userId,
    required this.username,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.dateOfBirth,
    required this.city,
    required this.country,
    required this.postalCode,
    required this.latestJob,
    required this.salaryIncomeAllowance,
    required this.isMarried,
    required this.cnicNumber,
  });

  factory ProperProfile.fromJson(Map<String, dynamic> json) => ProperProfile(
        id: json["id"],
        userId: json["UserId"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        role: json["role"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        city: json["city"],
        country: json["country"],
        postalCode: json["postalCode"],
        latestJob: json["latest_job"],
        salaryIncomeAllowance: json["salary_Income_allowance"],
        isMarried: json["is_married"],
        cnicNumber: json["cnic_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "UserId": userId,
        "username": username,
        "password": password,
        "email": email,
        "phoneNumber": phoneNumber,
        "role": role,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "city": city,
        "country": country,
        "postalCode": postalCode,
        "latest_job": latestJob,
        "salary_Income_allowance": salaryIncomeAllowance,
        "is_married": isMarried,
        "cnic_number": cnicNumber,
      };
}
