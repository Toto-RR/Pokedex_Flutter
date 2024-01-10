import 'package:flutter/material.dart';
import 'package:pokedex/api/poke_api.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/information/abilities_info.dart';
import 'package:pokedex/information/pokemon_info.dart';
import 'package:pokedex/provider/favorite_provider.dart';
import 'package:pokedex/screens/infoscreen/pokemon_content.dart';
import 'package:pokedex/widget/my_appbar.dart';
import 'package:provider/provider.dart';

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
      //Get the information (about and info tab)
      final pokemonSpecies = await ApiService.fetchPokemonInfo(widget.pokemonName);
      //Get the information (name, id, abilities, stats)
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

      _loadGenerationInfo();
    } catch (e) {
      // ignore: avoid_print
      print("Error al cargar la información del Pokémon: $e");
    }
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _loadGenerationInfo() async {
    try {
} catch (e) {
      // ignore: avoid_print
      print("Error al cargar la información de la generación: $e");
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = context.watch<FavoriteProvider>().isFavorite(pokemonInfo);

    return Scaffold(
      appBar: MyAppBar(appBarText: widget.pokemonName.toUpperCase()),
      backgroundColor: darkPokedex,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.network(
                  ApiService.getPokemonImageUrl(int.parse(widget.id)),
                  height: 300,
                  width: 300,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (isFavorite) {
                    context
                        .read<FavoriteProvider>()
                        .removeFromFavorites(pokemonInfo);
                  } else {
                    context
                        .read<FavoriteProvider>()
                        .addToFavorites(pokemonInfo);
                  }
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ],
          ),
          Expanded(
            child: PokemonContent(
              id: widget.id,
              pokemonName: widget.pokemonName,
              types: widget.types,
              stats: widget.stats,
              description: pokemonInfo.description,
              baseHappiness: pokemonInfo.baseHappiness,
              captureRate: pokemonInfo.captureRate,
              evolvesFrom: pokemonInfo.evolvesFrom,
              growthRate: pokemonInfo.growthRate,
              habitat: pokemonInfo.habitat,
              height: pokemonInfo.height.toDouble(),
              weight: pokemonInfo.weight.toDouble(),
              abilities: pokemonInfo.abilities,
            ),
          ),
        ],
      ),
    );
  }
}
