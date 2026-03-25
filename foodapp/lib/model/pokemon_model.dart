/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

PokemonModel pokemonModelFromJson(String str) => PokemonModel.fromJson(json.decode(str));

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
    PokemonModel({
        required this.next,
        required this.count,
        required this.results,
    });

    String next;
    int count;
    List<Result> results;

    factory PokemonModel.fromJson(Map<dynamic, dynamic> json) => PokemonModel(
        next: json["next"],
        count: 1,
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "next": next,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory Result.fromJson(Map<dynamic, dynamic> json) => Result(
        name: json["name"].toString(),
        url: json["url"],
    );

    Map<dynamic, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
