import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project04/model/pokemon_list_model.dart';

class PokemonListService extends ChangeNotifier{

  final String _url = 'pokeapi.co';
  final String _lastUrl = '/api/v2/pokemon';
  List<PokemonListModel> pokemonList = [];

  PokemonListService() {
    getDate();
  }

  getDate() async {
    var url = Uri.https(_url, _lastUrl, {} );
    final response = await http.get(url);
    final pokemonListModel = PokemonListModel.fromJson(json.decode(response.body));
    final pokemonList = pokemonListModel.results;
    notifyListeners();
  }
}