import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<Map<String, dynamic>> fetchPokemon(String name) async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchPokemonList(int limit, int offset) async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset'));
    if (response.statusCode == 200) {
      final List<dynamic> results = json.decode(response.body)['results'];
      final List<Map<String, dynamic>> pokemonList = await Future.wait(
        results.map((result) => fetchPokemon(result['name'])),
      );
      return pokemonList;
    } else {
      throw Exception('Failed to load Pokemon list');
    }
  }

  static String getPokemonImageUrl(int pokemonId) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokemonId.png';
  }

  static String capitalize(String text) {
    return text.substring(0, 1).toUpperCase() + text.substring(1);
  }

  static List<String> capitalizeList(List<dynamic> list) {
    return list.map((item) => capitalize(item['type']['name'])).toList();
  }

  static Map<String, Color> typeColors = {
    'fairy' : const Color.fromARGB(255, 220, 168, 220),
    'steel' : const Color.fromARGB(255, 180, 185, 203),
    'dark' : const Color.fromARGB(255, 37, 30, 22),
    'dragon' : const Color.fromARGB(255, 101, 58, 218),
    'ghost' : const Color.fromARGB(255, 101, 89, 135),
    'rock' : const Color.fromARGB(255, 181, 161, 46),
    'bug' : const Color.fromARGB(255, 162, 182, 34),
    'pyschic' : const Color.fromARGB(255, 218, 100, 131),
    'flying': const Color.fromARGB(255, 147, 148, 207),
    'ground': const Color.fromARGB(255, 201, 182, 101),
    'poison': const Color.fromARGB(255, 143, 73, 130),
    'fight': const Color.fromARGB(255, 199, 44, 22),
    'ice': const Color.fromARGB(255, 143, 220, 211),
    'grass': const Color.fromARGB(255, 127, 197, 88),
    'electric': const Color.fromARGB(255, 233, 208, 57),
    'water': const Color.fromARGB(255, 103, 147, 215),
    'fire': const Color.fromARGB(255, 235, 129, 40),
    'normal': const Color.fromARGB(255, 156, 164, 117),

    // Agrega más tipos y colores según sea necesario
  };
}
