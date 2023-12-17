import 'package:flutter/material.dart';
import 'package:pokedex/api/poke_api.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/widget/my_appbar.dart';
import 'package:pokedex/widget/poke_card.dart';
import 'package:pokedex/widget/toolbar.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}


class _InitialScreenState extends State<InitialScreen> {
  late Future<List<Map<String, dynamic>>> futurePokemonList;
  late ScrollController _scrollController;
  late List<Map<String, dynamic>> pokemonList;
  int offset = 0;
  int limit = 50;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    pokemonList = [];
    futurePokemonList = _fetchPokemonList(offset, limit);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Llegamos al final del scroll, carguemos más Pokémon
        offset += limit;
        _fetchPokemonList(offset, limit).then((newPokemonList) {
          setState(() {
            pokemonList.addAll(newPokemonList);
          });
        });
      }
    });
  }

  Future<List<Map<String, dynamic>>> _fetchPokemonList(
      int offset, int limit) async {
    final response = await ApiService.fetchPokemonList(limit, offset);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(appBarText: "POKÉDEX"),
      backgroundColor: darkPokedex,
      body: Column(
        children: [
          Toolbar(),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: futurePokemonList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  pokemonList = snapshot.data!;
                  return GridView.builder(
                    controller: _scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.0,
                    ),
                    itemCount: pokemonList.length,
                    itemBuilder: (context, index) {
                      final pokemon = pokemonList[index];
                      final name = pokemon['name'];
                      final types = pokemon['types'];
                      final id = pokemon['id'].toString().padLeft(3, '0');

                      return PokemonCard(
                        id: id,
                        name: name,
                        types: types,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}