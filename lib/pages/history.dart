import 'dart:convert';

History historyFromJson(String str) => History.fromJson(json.decode(str));

String historyToJson(History data) => json.encode(data.toJson());

class History {
  String id;
  String history;

  History({
    required this.id,
    required this.history,

  });

  factory History.fromJson(Map<String, dynamic> json) => History(
      id: json["id"],
      history: json["history"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "history": history,

  };
}
