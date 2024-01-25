// To parse this JSON data, do
//
//     final listingAllProject = listingAllProjectFromJson(jsonString);

import 'dart:convert';

List<ListingAllProject> listingAllProjectFromJson(String str) =>
    List<ListingAllProject>.from(
        json.decode(str).map((x) => ListingAllProject.fromJson(x)));

String listingAllProjectToJson(List<ListingAllProject> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListingAllProject {
  int projectId;
  int userId;
  String name;
  String field;
  String minimumInvestment;
  String guaranteedProfit;
  int chanceOfRisk;
  String description;
  String timeScale;

  ListingAllProject({
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

  factory ListingAllProject.fromJson(Map<String, dynamic> json) =>
      ListingAllProject(
        projectId: json["project_id"],
        userId: json["UserId"],
        name: json["name"],
        field: json["field"],
        minimumInvestment: json["minimum_investment"],
        guaranteedProfit: json["guaranteed_profit"],
        chanceOfRisk: json["chance_of_risk"],
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
