import 'package:flutter/material.dart';
import 'package:pokedex/api/poke_api.dart';
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
      
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}