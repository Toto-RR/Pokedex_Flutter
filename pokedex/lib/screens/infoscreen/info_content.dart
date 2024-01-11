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

 @override
  Widget build(BuildContext context) {
    Color beginColor = Colors.grey;
    Color endColor = Colors.grey;
    Color fontColor = Colors.white;

    switch (generation.generation) {
      case 'generation-i':
        beginColor = pokemonRed;
        endColor = pokemonBlue;
        fontColor = Colors.white;
        break;
      case 'generation-ii':
        beginColor = pokemonGold;
        endColor = pokemonSilver;
        fontColor = Colors.white;
        break;
      case 'generation-iii':
        beginColor = pokemonRuby;
        endColor = pokemonSapphire;
        fontColor = Colors.white;
        break;
      case 'generation-iv':
        beginColor = pokemonDiamond;
        endColor = pokemonPearl;
        fontColor = Colors.white;
        break;
      case 'generation-v':
        beginColor = pokemonBlack;
        endColor = pokemonWhite;
        fontColor = Colors.white;
        break;
      case 'generation-vi':
        beginColor = pokemonX;
        endColor = pokemonY;
        fontColor = Colors.white;
        break;
      case 'generation-vii':
        beginColor = pokemonSun;
        endColor = pokemonMoon;
        fontColor = Colors.white;
        break;
      case 'generation-viii':
        beginColor = pokemonSword;
        endColor = pokemonShield;
        fontColor = Colors.white;
        break;
      case 'generation-ix':
        beginColor = pokemonViolet;
        endColor = pokemonScarlet;
        fontColor = Colors.white;
        break;
      default:
        beginColor = Colors.grey;
        endColor = Colors.grey;
        break;
    }

TextStyle generationPillStyle = TextStyle(
      color: fontColor,
      fontSize: 15,
      shadows: const [
        BoxShadow(
          color: Colors.black,
          offset: Offset(2, 1),
          blurRadius: 2,
          blurStyle: BlurStyle.solid,
          spreadRadius: BorderSide.strokeAlignOutside
        )
      ],
    );
