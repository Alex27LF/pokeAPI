import 'dart:convert';

import 'package:poke_api/src/models/type_model.dart';
import 'package:http/http.dart' as http;

class TypesService {
  TypesService();

  final String _urlRoot = "https://pokeapi.co/api/v2/type";

  Future<TypePokemon?> getType(String tipo) async {
    TypePokemon type;
    try {
      var url = Uri.parse('$_urlRoot/$tipo');
      final response = await http.get(url);

      if (response.body.isEmpty) return null;
      type = TypePokemon.fromJson(json.decode(response.body));

      return type;
    } catch (ex) {
      return null;
    }
  }
}
