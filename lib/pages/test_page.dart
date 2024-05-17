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

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final album = snapshot.data!;
              final results = album.results;
              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final result = results[index];
                  return ListTile(
                    title: Text(result['name']),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        )
      )
    );
  }
}