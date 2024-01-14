import 'package:flutter/material.dart';
import 'package:pokedex/api/poke_api.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/information/pokemon_info.dart';
import 'package:pokedex/widget/poke_card.dart';

class AboutTab extends StatefulWidget {
  const AboutTab({
    Key? key,
    required this.id,
    required this.description,
    required this.baseHappiness,
    required this.captureRate,
    required this.evolvesFrom,
    required this.growthRate,
    required this.habitat,
  }) : super(key: key);

  final String id;
  final String description;
  final String baseHappiness;
  final String captureRate;
  final String evolvesFrom;
  final String growthRate;
  final String habitat;

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  Map<String, dynamic>? preevolutionDetails;

  @override
  void initState() {
    super.initState();
    _fetchEvolvesFromDetails();
  }

  Future<void> _fetchEvolvesFromDetails() async {
    if (widget.evolvesFrom.isNotEmpty) {
      try {
        final evolvesFromDetails =
            await ApiService.fetchPokemon(widget.evolvesFrom);
        setState(() {
          preevolutionDetails = evolvesFromDetails;
        });
      } catch (e) {
        // ignore: avoid_print
        print('Error fetching evolvesFrom details: $e');
      }
    }
  }

  String capitalize(String text) {
    return text.substring(0, 1).toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InfoRow(title: "Description", description: widget.description),
        InfoRow(title: "Base Happiness", description: widget.baseHappiness),
        InfoRow(title: "Capture Rate", description: "${widget.captureRate}%"),
        InfoRow(
          title: "Growth Rate",
          description: widget.growthRate,
        ),
        InfoRow(title: "Habitat", description: widget.habitat),
        preevolutionDetails != null
            ? _showPreEvoCard()
            : Text("This Pokemon has no preevolution", style: whiteNormalStyle),
      ],
    );
  }

  Widget _showPreEvoCard() {
    final name = preevolutionDetails!['name'];
    final types = preevolutionDetails!['types'];
    final id = preevolutionDetails!['id'].toString().padLeft(3, '0');
    final stats = preevolutionDetails!['stats'];

    final preevolutionInfo = PokemonInfo(
      id: id,
      pokemonName: name,
      types: types,
      stats: stats,
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

    return Column(
      children: [
        Text("Preevolution:", style: whiteNormalStyle),
        const SizedBox(height: 5),
        PokemonCard(
          pokemonInfo: preevolutionInfo,
        ),
      ],
    );
  }
}

class InfoPill extends StatelessWidget {
  const InfoPill({
    super.key,
    required this.title,
    required this.data,
  });

  final String data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Text("$title: $data",
          style: const TextStyle(
            color: Colors.white,
          )),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.title,
    required this.description,
  });

  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 150,
          padding: const EdgeInsets.all(10),
          child: Text(
            title.toUpperCase(),
            style: tabTitle,
          ),
        ),
        Container(
          width: 300,
          padding: const EdgeInsets.all(10),
          child: Text(
            description.replaceAll('\n', ' '),
            style: const TextStyle(color: Colors.white, fontSize: 15),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
