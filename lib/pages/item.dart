// To parse this JSON data, do
//
//     final conversation = conversationFromJson(jsonString);

import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  String id;
  String character1;
  String character2;



  Item({
    required this.id,
    required this.character1,
    required this.character2,

  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
      id: json["id"],
      character1: json["character1"],
      character2: json["character2"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "character1": character1,
    "character2": character2,

  };
}
