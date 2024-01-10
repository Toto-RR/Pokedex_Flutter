import 'package:flutter/material.dart';
import 'package:pokedex/api/poke_api.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/information/pokemon_info.dart';
import 'package:pokedex/widget/my_appbar.dart';
import 'package:pokedex/widget/poke_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  PokemonInfo? _searchResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(appBarText: "SEARCH"),
      backgroundColor: darkPokedex,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Enter Pokemon name",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: redPokedex, width: 5),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 4.0),
                ElevatedButton(
                  onPressed: () {
                    _searchPokemon();
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(50, 50),
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    padding: const EdgeInsets.all(16.0),
                  ),
                  child: const Icon(Icons.search, color: redPokedex),
                ),
              ],
            ),
          ),
          _searchResult != null
              ? _buildSearchResult()
              : const SizedBox(),
        ],
      ),
    );
  }

void _searchPokemon() async {
    final pokemonName = _searchController.text.trim().toLowerCase();
    if (pokemonName.isNotEmpty) {
      try {
        final result = await ApiService.fetchPokemon(pokemonName);
        setState(() {
          _searchResult = PokemonInfo(
            id: result['id'].toString(),
            pokemonName: result['name'],
            types: result['types'],
            stats: result['stats'],
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
        });
      } catch (e) {
        // Manejar el error, por ejemplo, mostrando un mensaje al usuario
        setState(() {
          _searchResult = null;
        });
      }
    }
  }

  Widget _buildSearchResult() {
    return Column(
      children: [
        Text("Results: ", style: whiteNormalStyle),
        const SizedBox(height: 10),
        PokemonCard(
          pokemonInfo: _searchResult!,
        ),
      ],
    );
  }
}