import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/information/generation_info.dart';
import 'package:pokedex/screens/infoscreen/stats_content.dart';

class PokemonContent extends StatefulWidget {
  const PokemonContent({
    Key? key,
    required this.pokemonName,
    required this.types,
    required this.stats,
    required this.description,
    required this.generations,
    required this.baseHappiness,
    required this.captureRate,
    required this.growthRate,
    required this.habitat,
    required this.height,
    required this.weight,
    required this.id,
    required this.evolvesFrom,
    required this.abilities,
  }) : super(key: key);

  final String id;
  final String pokemonName;
  final List types;
  final List stats;
  final String description;
  final GenerationInfo generations;
  final String baseHappiness;
  final String captureRate;
  final String evolvesFrom;
  final String growthRate;
  final String habitat;
  final double height;
  final double weight;
  final List abilities;

  @override
  State<PokemonContent> createState() => _PokemonContentState();
}

class _PokemonContentState extends State<PokemonContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: greyBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: redPokedex,
            offset: Offset(0, -3),
            blurRadius: 2,
          ),
        ],
      ),
      child: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabBar(
              labelColor: Colors.white,
              dividerColor: Colors.grey,
              unselectedLabelColor: Colors.grey,
              indicatorColor: redPokedex,
              controller: _tabController,
              tabs: const [
                Tab(text: "Stats", ),
                Tab(text: "About"),
                Tab(text: "Info"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  StatsTab(
                    stats: widget.stats,
                    pokemonName: widget.pokemonName,
                    types: widget.types,
                    abilities: widget.abilities,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
