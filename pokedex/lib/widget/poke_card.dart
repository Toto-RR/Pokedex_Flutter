import 'package:flutter/material.dart';
import 'package:pokedex/api/poke_api.dart';
import 'package:pokedex/information/pokemon_info.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonCard extends StatelessWidget {
  final PokemonInfo pokemonInfo;

  const PokemonCard({
    Key? key,
    required this.pokemonInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> typeColors = pokemonInfo.types.map((type) {
      String typeName = type['type']['name'];
      return ApiService.typeColors[typeName] ?? Colors.grey;
    }).toList();

    if (typeColors.length == 1) {
      typeColors.add(typeColors.first);
    }

    List<double> stops = [0.3, 0.7];

    return GestureDetector(
      onTap: () {
        
      },
      child: PokeCardDecoration(
        typeColors: typeColors,
        stops: stops,
        pokemonInfo: pokemonInfo,
      ),
    );
  }
}

class PokeCardDecoration extends StatelessWidget {
  const PokeCardDecoration({
    super.key,
    required this.typeColors,
    required this.stops,
    required this.pokemonInfo,
  });

  final List<Color> typeColors;
  final List<double> stops;
  final PokemonInfo pokemonInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 6,
            offset: Offset(0, 0),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          colors: typeColors,
          stops: stops,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: CardInformation(id: pokemonInfo.id, name: pokemonInfo.pokemonName),
    );
  }
}

class CardInformation extends StatelessWidget {
  const CardInformation({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  final String id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: CachedNetworkImage(
            imageUrl: ApiService.getPokemonImageUrl(int.parse(id)),
            height: 170,
            width: 170,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              ApiService.capitalize(name),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
            Text(
              id,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w300,
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}