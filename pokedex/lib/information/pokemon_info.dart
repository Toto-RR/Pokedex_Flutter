import 'package:pokedex/information/abilities_info.dart';

class PokemonInfo {
  final String id;
  late final String pokemonName;
  final List<dynamic> types;
  final List<dynamic> stats;
  final String description;
  final String generation;
  final String baseHappiness;
  final String captureRate;
  final String evolvesFrom;
  final String growthRate;
  final String habitat;
  final int height;
  final int weight;
  final List<Ability> abilities;

  PokemonInfo({
    required this.id,
    required this.pokemonName,
    required this.types,
    required this.stats,
    required this.description,
    required this.generation,
    required this.baseHappiness,
    required this.captureRate,
    required this.evolvesFrom,
    required this.growthRate,
    required this.habitat,
    required this.height,
    required this.weight,
    required this.abilities,
  });

  factory PokemonInfo.empty(
      String id, String pokemonName, List<dynamic> types, List<dynamic> stats) {
    return PokemonInfo(
      id: id,
      pokemonName: pokemonName,
      types: types,
      stats: stats,
      description: '',
      generation: '',
      baseHappiness: '',
      captureRate: '',
      evolvesFrom: '',
      growthRate: '',
      habitat: '',
      height: 0,
      weight: 0,
      abilities: List.empty(),
    );
  }
}
