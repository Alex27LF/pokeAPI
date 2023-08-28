import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_api/src/models/type_model.dart';
import 'package:poke_api/src/services/typesapi_services.dart';
import 'package:poke_api/src/utils/util_pokemon.dart';

class TiposPokemon extends StatefulWidget {
  const TiposPokemon({Key? key}) : super(key: key);

  @override
  State<TiposPokemon> createState() => _TiposPokemonState();
}

class _TiposPokemonState extends State<TiposPokemon> {
  List<String> tip = types;
  List<Widget> tipos = [];
  final TypesService _typesService = TypesService();

  @override
  void initState() {
    super.initState();
    addTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.h),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 5.h,
        children: tipos,
      ),
    );
  }

  Widget typePokemon(String type) {
    return InkWell(
      onTap: () async {
        TypePokemon? _typeStats = await _typesService.getType(type);

        setState(() {});
        showInfo(_typeStats!);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: colorCard(type),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(42.h),
            bottomLeft: Radius.circular(42.h),
          ),
        ),
        margin: EdgeInsets.all(5.h),
        child: Center(
          child: Text(
            getType(type),
            style: TextStyle(
                fontSize: 28.h,
                fontFamily: 'Yanone',
                color: Colors.white,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ),
    );
  }

  showInfo(TypePokemon typePokemon) {
    final size = MediaQuery.of(context).size;

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: size.height - 150,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(12.h, 30.h, 12.h, 12.h),
                  child: Column(
                    children: [
                      Text(
                        'Relación de Daño',
                        style: TextStyle(
                            fontSize: 18.h,
                            fontFamily: 'Yanone',
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(height: 10.h),
                      Divider(height: 1.5.h, color: Colors.black),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          porcentajeDamage('x2', Colors.green),
                          Text(
                            'Fuerte Contra:',
                            style: TextStyle(
                                fontSize: 23.h,
                                fontFamily: 'Yanone',
                                fontWeight: FontWeight.w300,
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                      SizedBox(height: 8.h),
                      typePokemon.doubleTo!.isNotEmpty
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: typePokemon.doubleTo!
                                    .map((e) => circleType(e["name"], 12, 23))
                                    .toList(),
                              ),
                            )
                          : textNone(),
                      SizedBox(height: 10.h),
                      Divider(height: 1.5.h, color: Colors.black),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          porcentajeDamage('x2', Colors.green),
                          Text(
                            'Débil Contra:',
                            style: TextStyle(
                                fontSize: 23.h,
                                fontFamily: 'Yanone',
                                fontWeight: FontWeight.w300,
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                      SizedBox(height: 8.h),
                      typePokemon.doubleFrom!.isNotEmpty
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: typePokemon.doubleFrom!
                                    .map((e) => circleType(e["name"], 12, 23))
                                    .toList(),
                              ),
                            )
                          : textNone(),
                      SizedBox(height: 10.h),
                      Divider(height: 1.5.h, color: Colors.black),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          porcentajeDamage('x1/2', Colors.orange),
                          Text(
                            'Medio daño a:',
                            style: TextStyle(
                                fontSize: 23.h,
                                fontFamily: 'Yanone',
                                fontWeight: FontWeight.w300,
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                      SizedBox(height: 8.h),
                      typePokemon.halfTo!.isNotEmpty
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: typePokemon.halfTo!
                                    .map((e) => circleType(e["name"], 12, 23))
                                    .toList(),
                              ),
                            )
                          : textNone(),
                      SizedBox(height: 10.h),
                      Divider(height: 1.5.h, color: Colors.black),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          porcentajeDamage('x1/2', Colors.amber),
                          Text(
                            'Medio daño de:',
                            style: TextStyle(
                                fontSize: 23.h,
                                fontFamily: 'Yanone',
                                fontWeight: FontWeight.w300,
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                      SizedBox(height: 8.h),
                      typePokemon.halfFrom!.isNotEmpty
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: typePokemon.halfFrom!
                                    .map((e) => circleType(e["name"], 12, 23))
                                    .toList(),
                              ),
                            )
                          : textNone(),
                      SizedBox(height: 10.h),
                      Divider(height: 1.5.h, color: Colors.black),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          porcentajeDamage('x0', Colors.black),
                          Text(
                            'Sin daño a:',
                            style: TextStyle(
                                fontSize: 23.h,
                                fontFamily: 'Yanone',
                                fontWeight: FontWeight.w300,
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                      SizedBox(height: 8.h),
                      typePokemon.noTo!.isNotEmpty
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: typePokemon.noTo!
                                    .map((e) => circleType(e["name"], 12, 23))
                                    .toList(),
                              ),
                            )
                          : textNone(),
                      SizedBox(height: 10.h),
                      Divider(height: 1.5.h, color: Colors.black),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          porcentajeDamage('x0', Colors.black),
                          Text(
                            'Sin daño de:',
                            style: TextStyle(
                                fontSize: 23.h,
                                fontFamily: 'Yanone',
                                fontWeight: FontWeight.w300,
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                      SizedBox(height: 8.h),
                      typePokemon.noFrom!.isNotEmpty
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: typePokemon.noFrom!
                                    .map((e) => circleType(e["name"], 12, 23))
                                    .toList(),
                              ),
                            )
                          : textNone(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -20.h,
              child: circleType(typePokemon.name ?? "", 25, 32),
            ),
            Positioned(
              top: -18.h,
              right: -15,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.h),
                  decoration: BoxDecoration(
                    color: colorCard(typePokemon.name ?? ""),
                    border: Border.all(color: Colors.black, width: 2.h),
                    borderRadius: BorderRadius.circular(25.h),
                  ),
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.h),
                      child: Icon(Icons.close_outlined,
                          size: 18.h, color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textNone() {
    return Center(
      child: Text(
        'Ninguno',
        style: TextStyle(
            fontSize: 23.h,
            fontFamily: 'Yanone',
            fontWeight: FontWeight.w300,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }

  Widget porcentajeDamage(String porcentaje, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.h),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 2.h),
        borderRadius: BorderRadius.circular(25.h),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 12.h),
        child: Text(
          porcentaje,
          style: TextStyle(
            fontSize: 18.h,
            color: Colors.white,
            fontFamily: 'Yanone',
          ),
        ),
      ),
    );
  }

  addTypes() {
    for (var item in tip) {
      tipos.add(typePokemon(item));
    }
  }
}
