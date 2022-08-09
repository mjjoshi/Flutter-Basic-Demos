// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

class PostDio {
  PostDio({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;
  factory PostDio.fromJson(Map<String, dynamic> json) => PostDio(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
