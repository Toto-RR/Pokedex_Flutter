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

return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GenerationPill(
            beginColor: beginColor,
            endColor: endColor,
            generation: generation,
            generationPillStyle: generationPillStyle,
          ),
          const SizedBox(height: 10),
          GamesList(generation: generation)
        ],
      ),
    );
  }
}

class GenerationPill extends StatelessWidget {
  const GenerationPill({
    super.key,
    required this.beginColor,
    required this.endColor,
    required this.generation,
    required this.generationPillStyle,
  });

  final Color beginColor;
  final Color endColor;
  final GenerationInfo generation;
  final TextStyle generationPillStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [beginColor, endColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.5, 0.5],
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(generation.generation.toUpperCase(), style: whiteSubTitleStyle),
          GenerationRow(
            name: "Region",
            data: generation.region,
            style: generationPillStyle,
          ),
          GenerationRow(
            name: "First Appareance",
            data: generation.firstGames,
            style: generationPillStyle,
          ),
        ],
      ),
    );
  }
}