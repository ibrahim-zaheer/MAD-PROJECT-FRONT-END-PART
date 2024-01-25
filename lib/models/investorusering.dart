// // To parse this JSON data, do
// //
// //     final investorUsering = investorUseringFromJson(jsonString);

// import 'dart:convert';

// List<InvestorUsering> investorUseringFromJson(String str) =>
//     List<InvestorUsering>.from(
//         json.decode(str).map((x) => InvestorUsering.fromJson(x)));

// String investorUseringToJson(List<InvestorUsering> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class InvestorUsering {
//   int investmentId;
//   int userId;
//   String fieldOfInvestment;
//   String yearsOfInvestment;
//   String minimumInvestment;
//   String minimumProfit;
//   int allowedRisk;
//   String description;
//   String timeScaleAllowed;

//   InvestorUsering({
//     required this.investmentId,
//     required this.userId,
//     required this.fieldOfInvestment,
//     required this.yearsOfInvestment,
//     required this.minimumInvestment,
//     required this.minimumProfit,
//     required this.allowedRisk,
//     required this.description,
//     required this.timeScaleAllowed,
//   });

//   factory InvestorUsering.fromJson(Map<String, dynamic> json) =>
//       InvestorUsering(
//         investmentId: json["investment_id"],
//         userId: json["UserId"],
//         fieldOfInvestment: json["field_of_investment"],
//         yearsOfInvestment: json["years_of_investment"],
//         minimumInvestment: json["minimum_investment"],
//         minimumProfit: json["minimum_profit"],
//         allowedRisk: json["allowed_risk"],
//         description: json["description"],
//         timeScaleAllowed: json["time_scale_allowed"],
//       );

//   Map<String, dynamic> toJson() => {
//         "investment_id": investmentId,
//         "UserId": userId,
//         "field_of_investment": fieldOfInvestment,
//         "years_of_investment": yearsOfInvestment,
//         "minimum_investment": minimumInvestment,
//         "minimum_profit": minimumProfit,
//         "allowed_risk": allowedRisk,
//         "description": description,
//         "time_scale_allowed": timeScaleAllowed,
//       };
// }
// To parse this JSON data, do
//
//     final investorUsering = investorUseringFromJson(jsonString);

import 'dart:convert';

List<InvestorUsering> investorUseringFromJson(String str) =>
    List<InvestorUsering>.from(
        json.decode(str).map((x) => InvestorUsering.fromJson(x)));

String investorUseringToJson(List<InvestorUsering> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InvestorUsering {
  int investmentId;
  int userId;
  String fieldOfInvestment;
  String yearsOfInvestment;
  String minimumInvestment;
  String minimumProfit;
  int allowedRisk;
  String description;
  String timeScaleAllowed;

  InvestorUsering({
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

  // factory InvestorUsering.fromJson(Map<String, dynamic> json) =>
  //     InvestorUsering(
  //       investmentId: json["investment_id"],
  //       userId: json["UserId"],
  //       fieldOfInvestment: json["field_of_investment"],
  //       yearsOfInvestment: json["years_of_investment"],
  //       minimumInvestment: json["minimum_investment"],
  //       minimumProfit: json["minimum_profit"],
  //       allowedRisk: json["allowed_risk"],
  //       description: json["description"],
  //       timeScaleAllowed: json["time_scale_allowed"],
  //     );

  // factory InvestorUsering.fromJson(Map<String, dynamic> json) =>
  //     InvestorUsering(
  //       investmentId: json["investment_id"],
  //       userId: (json["UserId"] as num).toInt(), // Explicitly convert to int
  //       fieldOfInvestment: json["field_of_investment"],
  //       yearsOfInvestment: json["years_of_investment"],
  //       minimumInvestment: json["minimum_investment"],
  //       minimumProfit: json["minimum_profit"],
  //       allowedRisk: json["allowed_risk"],
  //       description: json["description"],
  //       timeScaleAllowed: json["time_scale_allowed"],
  //     );

  factory InvestorUsering.fromJson(Map<String, dynamic> json) =>
      InvestorUsering(
        investmentId: json["investment_id"],
        userId: (json["UserId"] as num).toInt(), // Convert to int
        fieldOfInvestment: json["field_of_investment"],
        yearsOfInvestment: json["years_of_investment"],
        minimumInvestment: json["minimum_investment"],
        minimumProfit: json["minimum_profit"],
        allowedRisk: (json["allowed_risk"] as num).toInt(), // Convert to int
        description: json["description"],
        timeScaleAllowed: json["time_scale_allowed"],
      );

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
