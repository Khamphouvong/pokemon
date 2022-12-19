import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/features/pokedex/domain/entities/pokedex.dart';

part 'pokedex_model.g.dart';

@JsonSerializable()
class PokedexModel extends Pokedex {
  const PokedexModel(this.count, this.next, this.previous, this.results)
      : super(count, next, previous, results);

  final int count;
  final String next;
  final dynamic previous;
  final List<PokedexResultModel> results;

  factory PokedexModel.fromJson(Map<String, dynamic> json) =>
      _$PokedexModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokedexModelToJson(this);
}

@JsonSerializable()
class PokedexResultModel extends Result {
  const PokedexResultModel(this.name, this.url) : super(name, url);

  final String name;
  final String url;

  factory PokedexResultModel.fromJson(Map<String, dynamic> json) =>
      _$PokedexResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokedexResultModelToJson(this);
}
