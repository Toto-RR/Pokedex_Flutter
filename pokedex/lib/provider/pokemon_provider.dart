import 'package:flutter/material.dart';
import 'package:pokedex/api/poke_api.dart';
import 'package:pokedex/information/pokemon_info.dart';

class PokemonListProvider extends ChangeNotifier {
  final List<PokemonInfo> _pokemonList = [];
  bool _isLoading = false;
  List<PokemonInfo> get pokemonList => _pokemonList;
  bool get isLoading => _isLoading;

  Future<void> fetchMorePokemon(int offset, int limit) async {
    try {
      _isLoading = true;
      final newPokemonList = await ApiService.fetchPokemonList(limit, offset);

      // Mapear la lista de mapas a una lista de PokemonInfo
      final newPokemonInfoList = newPokemonList.map((pokemon) {
        return PokemonInfo(
          id: pokemon['id'].toString().padLeft(3, '0'),
          pokemonName: pokemon['name'],
          types: pokemon['types'],
          stats: pokemon['stats'],
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
      }).toList();

      _pokemonList.addAll(newPokemonInfoList);
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching Pokemon list: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}