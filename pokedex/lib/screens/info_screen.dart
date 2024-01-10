import 'package:flutter/material.dart';
import 'package:pokedex/api/poke_api.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/information/abilities_info.dart';
import 'package:pokedex/information/pokemon_info.dart';
import 'package:pokedex/widget/my_appbar.dart';

class InfoScreen extends StatefulWidget {
  final String pokemonName;
  final String id;
  final List<dynamic> types;
  final List<dynamic> stats;

  const InfoScreen({
    Key? key,
    required this.pokemonName,
    required this.id,
    required this.types,
    required this.stats,
  }) : super(key: key);

  static const Map<String, Color> statColors = {
    'hp': Colors.green,
    'attack': Colors.yellow,
    'defense': Colors.orange,
    'special-attack': Colors.blue,
    'special-defense': Color.fromARGB(255, 176, 64, 196),
    'speed': Colors.pink,
  };

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late PokemonInfo pokemonInfo;
  List<String> favoritePokemon = [];

  @override
  void initState() {
    super.initState();
    pokemonInfo = PokemonInfo.empty(
        widget.id, widget.pokemonName, widget.types, widget.stats);
        _loadPokemonInfo();
  }

  Future<void> _loadPokemonInfo() async {
    try {
      final pokemonSpecies = await ApiService.fetchPokemonInfo(widget.pokemonName);
      final pokemonData = await ApiService.fetchPokemon(widget.pokemonName);
      List<Ability> abilities = (pokemonData['abilities'] as List)
          .map((abilityJson) => Ability.fromJson(abilityJson))
          .toList();

      pokemonInfo = PokemonInfo(
        id: widget.id,
        pokemonName: widget.pokemonName,
        types: widget.types,
        stats: widget.stats,
        description: pokemonSpecies['flavor_text_entries'][0]['flavor_text'],
        generation: pokemonSpecies['generation']['name'],
        baseHappiness: pokemonSpecies['base_happiness'].toString(),
        captureRate: pokemonSpecies['capture_rate'].toString(),
        evolvesFrom: pokemonSpecies['evolves_from_species'] != null
            ? pokemonSpecies['evolves_from_species']['name']
            : 'No preevolution',
        growthRate: pokemonSpecies['growth_rate']['name'],
        habitat: pokemonSpecies['habitat'] != null
            ? pokemonSpecies['habitat']['name']
            : 'This pokemon has no habitat ',
        height: pokemonData['height'],
        weight: pokemonData['weight'],
        abilities: abilities,
      );

    } catch (e) {
      // ignore: avoid_print
      print("Error al cargar la información del Pokémon: $e");
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MyAppBar(appBarText: widget.pokemonName.toUpperCase()),
      backgroundColor: darkPokedex,
      body: Column(
       
      ),
    );
  }
}