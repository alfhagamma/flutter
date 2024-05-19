import 'dart:convert';
import 'package:flutter/material.dart';
import '../widgets/drawer_app.dart';
import 'package:http/http.dart' as http;

class Pokemon extends StatefulWidget{

  final String domain;
  final String route;

  const Pokemon({super.key, required this.domain, required this.route});

  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {

  late List pokemon = [];

  @override
  void initState() {
    super.initState();
    if(mounted) {
      fetchPokemon();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
      ),
      drawer: const DrawerApp(),
      body: Center(
        //child: Expanded(
          child: ListView.builder(
            itemCount: pokemon.length,
            itemBuilder: (context, index) => Text(pokemon[index]['name'])
          ),
        //),
      ),
    );
  }

  void fetchPokemon() {
    var url = Uri.https('pokeapi.co','/api/v2/pokemon');
    http.get(url)
    .then((response) {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        pokemon = data['results'];
        setState(() { });
      }
    })
    .catchError( (e) {
      
    });
  }
}
      