// To parse this JSON data, do
//
//     final investring = investringFromJson(jsonString);

import 'dart:convert';

List<Investring> investringFromJson(String str) =>
    List<Investring>.from(json.decode(str).map((x) => Investring.fromJson(x)));

String investringToJson(List<Investring> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Investring {
  final int investmentId;
  final int userId;
  final String fieldOfInvestment;
  final String yearsOfInvestment;
  final String minimumInvestment;
  final String minimumProfit;
  final double allowedRisk;
  final String description;
  final String timeScaleAllowed;

  Investring({
    required this.investmentId,
    required this.userId,
    required this.fieldOfInvestment,
    required this.yearsOfInvestment,
    required this.minimumInvestment,
    required this.minimumProfit,
    required this.allowedRisk,
    required this.description,
    required this.timeScaleAllowed,
  });

  factory Investring.fromJson(Map<String, dynamic> json) {
    return Investring(
      investmentId: json['investment_id'],
      userId: json['UserId'],
      fieldOfInvestment: json['field_of_investment'],
      yearsOfInvestment: json['years_of_investment'],
      minimumInvestment: json['minimum_investment'],
      minimumProfit: json['minimum_profit'],
      allowedRisk: json['allowed_risk'].toDouble(),
      description: json['description'],
      timeScaleAllowed: json['time_scale_allowed'],
    );
  }

  Map<String, dynamic> toJson() => {
        "investment_id": investmentId,
        "UserId": userId,
        "field_of_investment": fieldOfInvestment,
        "years_of_investment": yearsOfInvestment,
        "minimum_investment": minimumInvestment,
        "minimum_profit": minimumProfit,
        "allowed_risk": allowedRisk,
        "description": description,
        "time_scale_allowed": timeScaleAllowed,
      };
}
