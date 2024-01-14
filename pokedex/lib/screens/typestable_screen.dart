import 'package:flutter/material.dart';
import 'package:pokedex/api/poke_api.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/widget/my_appbar.dart';
import 'package:pokedex/widget/types_pill.dart';

class TypesTable extends StatefulWidget {
  final String type;

  const TypesTable({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<TypesTable> createState() => _TypesTableState();
}

class _TypesTableState extends State<TypesTable> {
  Map<String, dynamic>? damageRelations;
  String typeName = '';

  @override
  void initState() {
    super.initState();
    _loadPokemonInfo();
  }

  Future<void> _loadPokemonInfo() async {
    try {
      final pokemonData = await ApiService.fetchTypeInfo(widget.type);
      typeName = pokemonData['name'];
      damageRelations = pokemonData['damage_relations'];
    } catch (e) {
      // ignore: avoid_print
      print("Error al cargar la información del Pokémon: $e");
    }
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildDamageRelations() {
    if (damageRelations == null || damageRelations!.isEmpty) {
      return const Text('No hay información de relaciones de daño');
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("DAMAGE TO", style: whiteNormalStyle),
              const SizedBox(height: 20.0),
              _buildDamageList(
                  'Double Damage To', damageRelations!['double_damage_to']),
              _buildDamageList(
                  'Half Damage To', damageRelations!['half_damage_to']),
              _buildDamageList(
                  'No Damage To', damageRelations!['no_damage_to']),
            ],
          ),
          Column(
            children: [
              Text("DAMAGE FROM", style: whiteNormalStyle),
              const SizedBox(height: 20.0),
              _buildDamageList(
                  'Double Damage From', damageRelations!['double_damage_from']),
              _buildDamageList(
                  'Half Damage From', damageRelations!['half_damage_from']),
              _buildDamageList(
                  'No Damage From', damageRelations!['no_damage_from']),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDamageList(String title, List<dynamic>? damageList) {
    if (damageList == null || damageList.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: tabTitle),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: damageList.map((damage) {
            final typeName = damage['name'];
            Color typeColor = ApiService.typeColors[typeName] ?? Colors.grey;
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: TypePill(
                typeName: typeName,
                typeColor: typeColor,
                hPadding: 30.0,
                vPadding: 5.0,
                shadowColor: const Color.fromARGB(255, 15, 15, 15),
                pillStyle: pillsStyleShadow,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarText: typeName.toUpperCase()),
      backgroundColor: darkPokedex,
      body: Center(
        child: _buildDamageRelations(),
      ),
    );
  }
}
