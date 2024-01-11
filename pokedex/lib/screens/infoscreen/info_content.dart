import 'package:flutter/material.dart';
import 'package:pokedex_flutter/constants.dart';
import 'package:pokedex_flutter/information/generation_info.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({
    super.key,
    required this.generation,
    required this.height,
    required this.weight,
  });

  final GenerationInfo generation;
  final double height;
  final double weight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoRow(info: "Weight", data: weight),
              InfoRow(info: "Height", data: height),
            ],
          ),
        ),
        InfoGeneration(generation: generation)
      ],
    );
  }
}

class InfoGeneration extends StatelessWidget {
  const InfoGeneration({
    Key? key,
    required this.generation,
  }) : super(key: key);

  final GenerationInfo generation;
