import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_api/src/models/pokemon_model.dart';
import 'package:poke_api/src/utils/util_pokemon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final image = pokemon.image;
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: colorCard(pokemon.types![0]["type"]["name"] ?? ""),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(42.h),
            bottomLeft: Radius.circular(42.h),
          ),
        ),
        margin: EdgeInsets.all(5.h),
        child: Container(
          margin: EdgeInsets.all(5.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Image(
                        image: NetworkImage(image ?? ""),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                mayusculaPrimeraLetra(pokemon.name ?? ""),
                style: TextStyle(
                    fontSize: 25.h,
                    fontFamily: 'Yanone',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
