import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/about_page.dart';
import 'pages/home_page.dart';
import 'pages/pokemon_list_page.dart';
import 'pages/pokemon_page.dart';

import 'services/pokemon_list_services.dart';

import 'model/pokemon.dart';

void main(){
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ( _ ) => PokemonListService(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}
class MyApp extends StatelessWidget {

  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'Pokemon',
      routes: {
        '/': (BuildContext context) => const  HomePage(),
        '/about': (BuildContext context) => const  AboutPage(),
        '/pokemon': (BuildContext context) => const  Pokemon(domain: 'pokeapi.co', route: '/api/v2/pokemon',),
        '/pokemonPage': (BuildContext context) => const PokemonPage(),
        '/pokemonListPage': (BuildContext context) => const PokemonListPage(),
      },
      title: 'App Pokemon',
    );
  }
}