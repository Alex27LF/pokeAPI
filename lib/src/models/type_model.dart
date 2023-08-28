// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

TypePokemon typeFromJson(String str) => TypePokemon.fromJson(json.decode(str));

String typeToJson(TypePokemon data) => json.encode(data.toJson());

class TypePokemon {
  TypePokemon(
      {this.name,
      this.doubleFrom,
      this.doubleTo,
      this.halfFrom,
      this.halfTo,
      this.noFrom,
      this.noTo});

  String? name;
  List<dynamic>? doubleFrom;
  List<dynamic>? doubleTo;
  List<dynamic>? halfFrom;
  List<dynamic>? halfTo;
  List<dynamic>? noFrom;
  List<dynamic>? noTo;

  factory TypePokemon.fromJson(Map<String, dynamic> json) => TypePokemon(
        name: json["name"],
        doubleFrom:
            List<dynamic>.from(json["damage_relations"]["double_damage_from"]),
        doubleTo:
            List<dynamic>.from(json["damage_relations"]["double_damage_to"]),
        halfFrom:
            List<dynamic>.from(json["damage_relations"]["half_damage_from"]),
        halfTo: List<dynamic>.from(json["damage_relations"]["half_damage_to"]),
        noFrom: List<dynamic>.from(json["damage_relations"]["no_damage_from"]),
        noTo: List<dynamic>.from(json["damage_relations"]["no_damage_to"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "doubleFrom": List<dynamic>.from(doubleFrom!.map((x) => x)),
        "doubleTo": List<dynamic>.from(doubleTo!.map((x) => x)),
        "halfFrom": List<dynamic>.from(halfFrom!.map((x) => x)),
        "halfTo": List<dynamic>.from(halfTo!.map((x) => x)),
        "noFrom": List<dynamic>.from(noFrom!.map((x) => x)),
        "noTo": List<dynamic>.from(noTo!.map((x) => x)),
      };
}
