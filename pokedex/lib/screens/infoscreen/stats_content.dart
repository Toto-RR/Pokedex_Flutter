import 'package:flutter/material.dart';
import 'package:pokedex/api/poke_api.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/widget/types_pill.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({
    super.key,
    required this.pokemonName,
    required this.types,
    required this.stats,
    required this.abilities,
  });

  final String pokemonName;
  final List types;
  final List stats;
  final List abilities;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(pokemonName.toUpperCase(), style: whiteTitleStyle),
        ),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: Types(types: types),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var ability in abilities)
                  AbilityRow(
                    whichAbility:
                        ability.isHidden ? "Hidden Ability" : "Primary Ability",
                    ability: ability.name,
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class AbilityRow extends StatelessWidget {
  const AbilityRow({
    super.key,
    required this.whichAbility,
    required this.ability,
  });

  final String ability;
  final String whichAbility;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(ability.toUpperCase(), style: whiteNormalStyle),
          Text(whichAbility, style: tabTitle),
        ],
      ),
    );
  }
}


class Types extends StatelessWidget {
  const Types({
    super.key,
    required this.types,
  });

  final List types;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: types.map(
        (type) {
          String typeName = type['type']['name'];
          Color typeColor = ApiService.typeColors[typeName] ?? Colors.grey;

          return TypePill(
            typeColor: typeColor,
            typeName: typeName,
            hPadding: 60.0,
            vPadding: 5.0,
            shadowColor: const Color.fromARGB(255, 58, 58, 58),
            pillStyle: pillsStyleShadow,
          );
        },
      ).toList(),
    );
  }
}
