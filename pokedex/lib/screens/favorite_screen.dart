import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/information/pokemon_info.dart';
import 'package:pokedex/provider/favorite_provider.dart';
import 'package:pokedex/widget/my_appbar.dart';
import 'package:pokedex/widget/poke_card.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<PokemonInfo> favoritePokemonList =
        Provider.of<FavoriteProvider>(context).getFavoritePokemonList();

    return Scaffold(
      appBar: const MyAppBar(appBarText: 'FAVORITES'),
      backgroundColor: darkPokedex,
      body: ListView.builder(
        itemCount: favoritePokemonList.length,
        itemBuilder: (context, index) {
          PokemonInfo pokemonInfo = favoritePokemonList[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: PokemonCard(pokemonInfo: pokemonInfo),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<FavoriteProvider>()
                        .removeFromFavorites(pokemonInfo);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(redPokedex),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(16.0)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    mouseCursor: MaterialStateMouseCursor.clickable
                  ),
                  child: const Text('Remove from Favorites'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}