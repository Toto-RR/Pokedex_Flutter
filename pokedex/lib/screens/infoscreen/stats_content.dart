import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';

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
