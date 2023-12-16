import 'package:flutter/material.dart';
import 'package:pokedex/data/info_data.dart';


class PokemonBasicData {
  final String name;
  final String url;
  String id;
  String imageUrl;
  Color? cardColor;
  PokemonMoreInfoData? pokemonMoreInfoData;

  PokemonBasicData({
    required this.name,
    required this.url,
    this.id = '000',
    this.imageUrl = '',
    this.cardColor = Colors.grey,
    this.pokemonMoreInfoData,
  });
}
