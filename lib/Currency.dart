import 'dart:convert';

Currency currencyFromJson(String str) => Currency.fromJson(json.decode(str));

String currencyToJson(Currency data) => json.encode(data.toJson());

class Currency {
  bool? success;
  Map<String, String>? result;

  Currency({
    this.success,
    this.result,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        success: json["success"],
        result: Map.from(json["result"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result":
            Map.from(result!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
