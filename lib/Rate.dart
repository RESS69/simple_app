// To parse this JSON data, do
//
//     final rate = rateFromJson(jsonString);

import 'dart:convert';

Rate rateFromJson(String str) => Rate.fromJson(json.decode(str));

String rateToJson(Rate data) => json.encode(data.toJson());

class Rate {
  bool? success;
  int? timestamp;
  DateTime? date;
  String? base;
  Map<String, double>? result;

  Rate({
    this.success,
    this.timestamp,
    this.date,
    this.base,
    this.result,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        success: json["success"],
        timestamp: json["timestamp"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        base: json["base"],
        result: Map.from(json["result"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "timestamp": timestamp,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "base": base,
        "result":
            Map.from(result!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
