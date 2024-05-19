import 'dart:convert';

class PokemonListModel {
    int count;
    String next;
    dynamic previous;
    List<PokemonModel> results;

    PokemonListModel({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    factory PokemonListModel.fromRawJson(String str) => PokemonListModel.fromJson(json.decode(str));

    factory PokemonListModel.fromJson(Map<String, dynamic> json) => PokemonListModel(
        count   : json["count"],
        next    : json["next"],
        previous: json["previous"],
        results : List<PokemonModel>.from(json["results"].map((x) => PokemonModel.fromJson(x))),
    );
}

class PokemonModel {
    String name;
    String url;

    PokemonModel({
        required this.name,
        required this.url,
    });

    factory PokemonModel.fromRawJson(String str) => PokemonModel.fromJson(json.decode(str));

    factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json["name"],
        url : json["url"],
    );
}
