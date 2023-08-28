import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poke_api/src/models/pokemon_model.dart';
import 'dart:developer' as developer;

class PokeService {
  PokeService();
  final String _urlRoot = "https://pokeapi.co/api/v2/pokemon";

  Future<List<Pokemon>?> getPokemones() async {
    List<Pokemon> result = [];
    try {
      for (var i = 1; i <= 10; i++) {
        var url = Uri.parse('$_urlRoot/$i');
        final response = await http.get(url);

        if (response.body.isEmpty) return result;
        final pokemon = Pokemon.fromJson(json.decode(response.body));
        result.add(pokemon);
      }

      return result;
    } catch (ex) {
      return result;
    }
  }

  Future<Pokemon?> getPokemon(String id) async {
    Pokemon pokemon;
    try {
      var url = Uri.parse('$_urlRoot/$id');
      final response = await http.get(url);

      if (response.body.isEmpty) return null;
      pokemon = Pokemon.fromJson(json.decode(response.body));

      return pokemon;
    } catch (ex) {
      developer.log("Poke nulo" + ex.toString());
      return null;
    }
  }
}
