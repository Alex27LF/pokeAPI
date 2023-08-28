import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:poke_api/src/widgets/pokemon_random_widget.dart';
import 'package:poke_api/src/widgets/pokemon_widget.dart';
import 'package:poke_api/src/widgets/tipo_pokemon_widget.dart';

class MenuAppBar extends StatefulWidget {
  const MenuAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuAppBar> createState() => _MenuAppBarState();
}

class _MenuAppBarState extends State<MenuAppBar>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = <Tab>[
    const Tab(
      text: "Pokémones",
      icon: Image(
        image: AssetImage("assets/img/pokeball.png"),
        width: 20,
      ),
    ),
    const Tab(
      text: "Poke Random",
      icon: Image(
        image: AssetImage("assets/img/pokemon.png"),
        width: 20,
      ),
    ),
    const Tab(
      text: "Tipos",
      icon: Image(
        image: AssetImage("assets/img/ditto.png"),
        width: 20,
      ),
    ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TabBar(
          labelStyle: TextStyle(
              fontFamily: 'Pokemon', fontSize: 18.h, color: Colors.deepPurple),
          tabs: _tabs,
          indicatorWeight: 3,
          labelColor: Colors.blueGrey,
          indicatorColor: Colors.blueGrey,
          controller: _tabController,
        ),
        body: TabBarView(children: const [
          PokemonWidget(),
          PokemonRandomWidget(),
          TiposPokemon()
        ], controller: _tabController));
  }
}
