import 'dart:convert';

NaionaliseApiResModel naionaliseApiResModelFromJson(String str) =>
    NaionaliseApiResModel.fromJson(json.decode(str));

class NaionaliseApiResModel {
  num? count;
  String? name;
  List<Country>? country;

  NaionaliseApiResModel({
    this.count,
    this.name,
    this.country,
  });

  factory NaionaliseApiResModel.fromJson(Map<String, dynamic> json) =>
      NaionaliseApiResModel(
        count: json["count"],
        name: json["name"],
        country: json["country"] == null
            ? []
            : List<Country>.from(
                json["country"]!.map((x) => Country.fromJson(x))),
      );
}

class Country {
  String? countryId;
  num? probability;

  Country({
    this.countryId,
    this.probability,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        countryId: json["country_id"],
        probability: json["probability"]?.toDouble(),
      );
}
