import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_api/src/models/pokemon_model.dart';
import 'package:poke_api/src/services/pokeapi_services.dart';

import 'package:poke_api/src/widgets/pokemon_card_wdiget.dart';

class PokemonWidget extends StatefulWidget {
  const PokemonWidget({Key? key}) : super(key: key);

  @override
  State<PokemonWidget> createState() => _PokemonWidgetState();
}

class _PokemonWidgetState extends State<PokemonWidget> {
  List<Pokemon>? _pokemones;
  final PokeService _pokeService = PokeService();

  @override
  void initState() {
    super.initState();

    _downloadPokemones();
  }

  @override
  Widget build(BuildContext context) {
    return _pokemones == null
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(
                  strokeWidth: 4.0,
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Text(
                  "Cargando Pokémones",
                  style: TextStyle(fontSize: 25, fontFamily: 'Yanone'),
                )
              ],
            ),
          )
        : _pokemones!.isEmpty
            ? const Center(
                child: Text(
                  "No hay Pokémones Disponibles...",
                  style: TextStyle(fontSize: 25, fontFamily: 'Yanone'),
                ),
              )
            : Container(
                margin: EdgeInsets.all(12.h),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.h,
                  children:
                      _pokemones!.map((e) => PokemonCard(pokemon: e)).toList(),
                ),
              );
  }

  _downloadPokemones() async {
    _pokemones = await _pokeService.getPokemones();
    if (mounted) {
      setState(() {});
    }
  }
}
