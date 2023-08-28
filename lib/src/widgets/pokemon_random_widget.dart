import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_api/src/models/pokemon_model.dart';
import 'package:poke_api/src/services/pokeapi_services.dart';
import 'package:poke_api/src/utils/util_pokemon.dart';

class PokemonRandomWidget extends StatefulWidget {
  const PokemonRandomWidget({Key? key}) : super(key: key);

  @override
  State<PokemonRandomWidget> createState() => _PokemonRandomWidgetState();
}

class _PokemonRandomWidgetState extends State<PokemonRandomWidget> {
  final PokeService _pokeService = PokeService();
  Pokemon _pokemon = poke();

  @override
  void initState() {
    var rng = Random().nextInt(850);

    _downloadPokemon(rng.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String image = _pokemon.image!;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          var rng = Random().nextInt(850);

          _downloadPokemon(rng.toString());
          setState(() {});
        },
        label: Row(
          children: [
            Icon(Icons.refresh_outlined, size: 18.h),
            SizedBox(width: 5.h),
            Text(
              "Cambiar Pokémon",
              style: TextStyle(fontFamily: 'Yanone', fontSize: 15.h),
            )
          ],
        ),
        elevation: 18.h,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          margin: EdgeInsets.all(18.h),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.h),
                    bottomRight: Radius.circular(45.h),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      colorCard(_pokemon.types![0]["type"]["name"]),
                      Colors.white,
                      _pokemon.types!.length > 1
                          ? colorCard(_pokemon.types![1]["type"]["name"])
                          : colorCard(_pokemon.types![0]["type"]["name"]),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(image),
                      radius: 85.h,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      mayusculaPrimeraLetra(_pokemon.name!),
                      style: TextStyle(
                          fontSize: 32.h,
                          fontFamily: 'Yanone',
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.clip),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _pokemon.types!
                          .map((e) => typePokemon(e["type"]["name"]))
                          .toList(),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
              Container(margin: EdgeInsets.all(12.h), child: viewStats()),
            ],
          ),
        ),
      ),
    );
  }

  Widget viewStats() {
    List<Widget> stats = [];
    List<Widget> stats2 = [];
    for (var i = 0; i < _pokemon.stats!.length; i++) {
      i < 3
          ? stats.add(statsCard(_pokemon.stats![i]))
          : stats2.add(statsCard(_pokemon.stats![i]));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: stats,
        ),
        Column(
          children: stats2,
        )
      ],
    );
  }

  Widget statsCard(dynamic stat) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.h, vertical: 3.h),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade300,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(3.h),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.h),
        child: Row(
          children: [
            Text(
              getStat(stat["stat"]["name"]),
              style: TextStyle(
                fontSize: 25.h,
                color: Colors.black,
                fontFamily: 'Yanone',
              ),
            ),
            SizedBox(width: 5.h),
            Text(
              stat["base_stat"].toString(),
              style: TextStyle(
                fontSize: 25.h,
                color: Colors.white,
                fontFamily: 'Yanone',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget typePokemon(String type) {
    return Container(
      decoration: BoxDecoration(
        color: colorCard(type),
        border: Border.all(color: Colors.black, width: 2.h),
        borderRadius: BorderRadius.circular(25.h),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.h),
        child: Text(
          getType(type),
          style: TextStyle(
            fontSize: 25.h,
            color: Colors.white,
            fontFamily: 'Yanone',
          ),
        ),
      ),
    );
  }

  _downloadPokemon(String id) async {
    _pokemon = (await _pokeService.getPokemon(id))!;
    if (mounted) {
      setState(() {});
    }
  }
}
