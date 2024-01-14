import 'package:flutter/material.dart';
import 'package:pokedex/api/poke_api.dart';
import 'package:pokedex/screens/typestable_screen.dart';

class TypePill extends StatelessWidget {
  const TypePill({
    Key? key,
    required this.typeColor,
    required this.typeName,
    required this.hPadding,
    required this.vPadding,
    required this.shadowColor,
    required this.pillStyle,
  }) : super(key: key);

  final Color typeColor;
  final String typeName;
  final double hPadding;
  final double vPadding;
  final Color shadowColor;
  final TextStyle pillStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TypesTable(
              type: typeName,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        padding: EdgeInsets.symmetric(
          horizontal: hPadding,
          vertical: vPadding,
        ),
        decoration: BoxDecoration(
          color: typeColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: const Offset(0, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Text(
          ApiService.capitalize(typeName).toUpperCase(),
          style: pillStyle,
        ),
      ),
    );
  }
}
