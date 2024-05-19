import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import '../services/pokemon_list_services.dart';
import 'package:provider/provider.dart';

//import 'services/pokemon_list_services.dart';

import '../widgets/drawer_app.dart';

class PokemonListPage extends StatelessWidget {

  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {

    final pokemonList = Provider.of<PokemonListService>(context);
    print(pokemonList.pokemonList);

    return  Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(
        title: const Text('List Pokemon'),
        backgroundColor: Colors.blue,
        actions:  [
          IconButton(
            icon: const Icon(Icons.abc_rounded),
            onPressed: () {},
          ), 
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print(pokemonList.getDate());
          }, 
          child: const Text('Touch me'),
        ),
      ),
    );
  }
}