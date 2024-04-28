// To parse this JSON data, do
//
//     final conversation = conversationFromJson(jsonString);

import 'dart:convert';

Conversation conversationFromJson(String str) => Conversation.fromJson(json.decode(str));

String conversationToJson(Conversation data) => json.encode(data.toJson());

class Conversation {
  String id;
  String username;
  String place;
  String rate;
  String comment;

  Conversation({
    required this.id,
    required this.username,
    required this.place,
    required this.rate,
    required this.comment,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
    id: json["id"],
    username: json["username"],
    place: json["place"],
    rate: json["rate"],
      comment:json["comment"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "place": place,
    "rate":rate,
    "comment":comment,
  };
}
