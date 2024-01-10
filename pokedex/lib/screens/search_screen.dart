import 'package:flutter/material.dart';
import 'package:pokedex_flutter/constants.dart';
import 'package:pokedex_flutter/information/pokemon_info.dart';
import 'package:pokedex_flutter/api/pokeapi.dart';
import 'package:pokedex_flutter/widgets/my_appbar.dart';
import 'package:pokedex_flutter/widgets/poke_card.dart';

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

