import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project04/widgets/drawer_app.dart';

Future<PokemonData> fetchData() async {
  final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));
  if (response.statusCode == 200) {
    return PokemonData.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

class PokemonData {

  final String next;
  final List<dynamic> results;

  const PokemonData({
    required this.next,
    required this.results,
  });

  factory PokemonData.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'next': String next,
        'results': List<dynamic> results,
      } =>
        PokemonData(
          next: next,
          results: results,
        ),
      _ => throw const FormatException('Failed to load Pokemon.'),
    };
  }
}

class PokemonPage extends StatefulWidget {

  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  
  late Future<PokemonData> futurePokemon;

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<PokemonData>(
          future: futurePokemon,
          builder: (context, asyncData) {
            if (asyncData.hasData) {
              final results = asyncData.data!.results;
              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final result = results[index];
                  return ListTile(
                    title: Text(result['name']),
                  );
                },
              );
            } else if (asyncData.hasError) {
              return Text('${asyncData.error}');
            }
            return const CircularProgressIndicator();
          },
        )
      )
    );
  }
}
