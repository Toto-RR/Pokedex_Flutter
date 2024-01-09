import 'package:flutter/material.dart';
import 'package:pokedex/information/pokemon_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider with ChangeNotifier {
  static const _favoritesKey = 'favoritePokemonList';
  final List<PokemonInfo> _favoritePokemonList = [];

  List<PokemonInfo> getFavoritePokemonList() {
    return _favoritePokemonList;
  }

  Future<void> addToFavorites(PokemonInfo pokemon) async {
    _favoritePokemonList.add(pokemon);
    await _saveFavorites();
    notifyListeners();
  }

  Future<void> removeFromFavorites(PokemonInfo pokemon) async {
    _favoritePokemonList.remove(pokemon);
    await _saveFavorites();
    notifyListeners();
  }

  bool isFavorite(PokemonInfo pokemon) {
    return _favoritePokemonList.contains(pokemon);
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIds = _favoritePokemonList.map((pokemon) => pokemon.id).toList();
    await prefs.setStringList(_favoritesKey, favoriteIds);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIds = prefs.getStringList(_favoritesKey) ?? [];
    _favoritePokemonList.clear();
    for (var id in favoriteIds) {
      // Puedes cargar el resto de la información del Pokémon aquí
      final pokemon = PokemonInfo.empty(id, '', [], []);
      _favoritePokemonList.add(pokemon);
    }
    notifyListeners();
  }
}