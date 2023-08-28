// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  Pokemon({
    this.name,
    this.image,
    this.types,
    this.stats,
  });

  String? name;
  String? image;
  List<dynamic>? types;
  List<dynamic>? stats;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        image: json["sprites"]["other"]["official-artwork"]["front_default"],
        types: List<dynamic>.from(json["types"]),
        stats: List<dynamic>.from(json["stats"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "types": List<dynamic>.from(types!.map((x) => x)),
        "stats": List<dynamic>.from(stats!.map((x) => x)),
      };
}
