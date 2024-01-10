import 'package:flutter/material.dart';

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
      children: [],
    );
  }
}
