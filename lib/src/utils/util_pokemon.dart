import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_api/src/models/pokemon_model.dart';

String mayusculaPrimeraLetra(String name) {
  return name[0].toUpperCase() + name.substring(1);
}

Color colorCard(String type) {
  switch (type) {
    case 'water':
      return const Color(0xff43ccff);
    case 'grass':
      return Colors.green;
    case 'fire':
      return const Color(0xffe95c4d);
    case 'normal':
      return const Color(0xffa5a5a5);
    case 'bug':
      return const Color(0xffaedf78);
    case 'fighting':
      return const Color(0xffe81319);
    case 'flying':
      return const Color(0xff5eb9b2);
    case 'poison':
      return const Color(0xff611380);
    case 'ground':
      return const Color(0xffbfac21);
    case 'rock':
      return const Color(0xff776a3e);
    case 'ghost':
      return const Color(0xff8e55a4);
    case 'steel':
      return const Color(0xff7b8e8a);
    case 'electric':
      return const Color(0xfff9be00);
    case 'psychic':
      return const Color(0xff8a0532);
    case 'ice':
      return const Color(0xff66d1e5);
    case 'dragon':
      return const Color(0xff29036a);
    case 'dark':
      return const Color(0xff2d221c);
    case 'fairy':
      return const Color(0xfff87ea7);
    default:
      return (Colors.white);
  }
}

String getType(String type) {
  switch (type) {
    case 'water':
      return 'Agua';
    case 'grass':
      return 'Planta';
    case 'fire':
      return 'Fuego';
    case 'normal':
      return 'Normal';
    case 'bug':
      return 'Bicho';
    case 'fighting':
      return 'Lucha';
    case 'flying':
      return 'Volador';
    case 'poison':
      return 'Veneno';
    case 'ground':
      return 'Tierra';
    case 'rock':
      return 'Roca';
    case 'ghost':
      return 'Fantasma';
    case 'steel':
      return 'Acero';
    case 'electric':
      return 'Eléctrico';
    case 'psychic':
      return 'Psíquico';
    case 'ice':
      return 'Hielo';
    case 'dragon':
      return 'Dragón';
    case 'dark':
      return 'Siniestro';
    case 'fairy':
      return 'Hada';
    default:
      return 'Desconocido';
  }
}

String getStat(String stat) {
  switch (stat) {
    case 'hp':
      return 'HP';
    case 'attack':
      return 'Ataque';
    case 'defense':
      return 'Defensa';
    case 'special-attack':
      return 'Ataque Especial';
    case 'special-defense':
      return 'Defensa Especial';
    case 'speed':
      return 'Velocidad';
    default:
      return 'Desconocido';
  }
}

Pokemon poke() {
  return Pokemon(
      name: 'Lucario',
      image:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/448.png',
      stats: [],
      types: [
        {
          'type': {'name': 'fighting'}
        },
        {
          'type': {'name': 'steel'}
        }
      ]);
}

List<String> types = [
  'water',
  'grass',
  'fire',
  'normal',
  'bug',
  'fighting',
  'flying',
  'poison',
  'ground',
  'rock',
  'ghost',
  'steel',
  'electric',
  'psychic',
  'ice',
  'dragon',
  'dark',
  'fairy'
];

Widget circleType(String type, int padH, int fontSize) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 3.h),
    decoration: BoxDecoration(
      color: colorCard(type),
      border: Border.all(color: Colors.black, width: 2.h),
      borderRadius: BorderRadius.circular(25.h),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: padH.h),
      child: Text(
        getType(type),
        style: TextStyle(
          fontSize: fontSize.h,
          color: Colors.white,
          fontFamily: 'Yanone',
        ),
      ),
    ),
  );
}
