import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/provider/pokemon_provider.dart';
import 'package:pokedex/widget/my_appbar.dart';
import 'package:pokedex/widget/poke_card.dart';
import 'package:pokedex/widget/toolbar.dart';
import 'package:provider/provider.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}


class _InitialScreenState extends State<InitialScreen> {
  late ScrollController _scrollController;
  late PokemonListProvider _pokemonListProvider;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _pokemonListProvider = PokemonListProvider();
    _pokemonListProvider.fetchMorePokemon(0, 53);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
          !_pokemonListProvider.isLoading) {
        _pokemonListProvider.fetchMorePokemon(_pokemonListProvider.pokemonList.length, 53);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _pokemonListProvider,
      child: Scaffold(
        appBar: const MyAppBar(appBarText: "POKÉDEX"),
        backgroundColor: darkPokedex,
        body: Column(
          children: [
            const Toolbar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Consumer<PokemonListProvider>(
                  builder: (context, provider, _) {
                    if (provider.isLoading && provider.pokemonList.isEmpty) {
                      return Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator()
                        );
                    } else if (provider.pokemonList.isEmpty) {
                      return const Text('No Pokemon available.');
                    } else {
                      return GridView.builder(
                        controller: _scrollController,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16.0,
                        ),
                        itemCount: provider.pokemonList.length,
                        itemBuilder: (context, index) {
                          final pokemonInfo = provider.pokemonList[index];
                
                          return GestureDetector(
                            onTap: () {
                              
                            },
                            child: PokemonCard(
                              pokemonInfo: pokemonInfo,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}