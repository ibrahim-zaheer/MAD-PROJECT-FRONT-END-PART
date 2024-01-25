// To parse this JSON data, do
//
//     final usering = useringFromJson(jsonString);

import 'dart:convert';

List<Usering> useringFromJson(String str) =>
    List<Usering>.from(json.decode(str).map((x) => Usering.fromJson(x)));

String useringToJson(List<Usering> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usering {
  int projectId;
  int userId;
  String name;
  String field;
  String minimumInvestment;
  String guaranteedProfit;
  double chanceOfRisk;
  String description;
  String timeScale;

  Usering({
    required this.projectId,
    required this.userId,
    required this.name,
    required this.field,
    required this.minimumInvestment,
    required this.guaranteedProfit,
    required this.chanceOfRisk,
    required this.description,
    required this.timeScale,
  });

  factory Usering.fromJson(Map<String, dynamic> json) => Usering(
        projectId: json["project_id"],
        userId: json["UserId"],
        name: json["name"],
        field: json["field"],
        minimumInvestment: json["minimum_investment"],
        guaranteedProfit: json["guaranteed_profit"],
        chanceOfRisk: json["chance_of_risk"]?.toDouble(),
        description: json["description"],
        timeScale: json["time_scale"],
      );

  Map<String, dynamic> toJson() => {
        "project_id": projectId,
        "UserId": userId,
        "name": name,
        "field": field,
        "minimum_investment": minimumInvestment,
        "guaranteed_profit": guaranteedProfit,
        "chance_of_risk": chanceOfRisk,
        "description": description,
        "time_scale": timeScale,
      };
}
