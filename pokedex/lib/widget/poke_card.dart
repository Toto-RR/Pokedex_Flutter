import 'package:flutter/material.dart';
import 'package:pokedex/api/poke_api.dart';

class PokemonCard extends StatelessWidget {
  final String id;
  final String name;
  final List<dynamic> types;

  const PokemonCard({super.key, 
    required this.id,
    required this.name,
    required this.types,
  });

  @override
  Widget build(BuildContext context) {
    List<Color> typeColors = types.map((type) {
      String typeName = type['type']['name'];
      return ApiService.typeColors[typeName] ?? Colors.grey;
    }).toList();

    if (typeColors.length == 1) {
      typeColors.add(typeColors.first);
    }

    List<double> stops = [0.4, 0.6];

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Image.network(
              ApiService.getPokemonImageUrl(int.parse(id)),
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
      ),
    );
  }
}
