// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  int id;
  String? body;
  DateTime updated;
  DateTime created;

  Post({
    required this.id,
    required this.body,
    required this.updated,
    required this.created,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        body: json["body"],
        updated: DateTime.parse(json["updated"]),
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "body": body,
        "updated": updated.toIso8601String(),
        "created": created.toIso8601String(),
      };
}
