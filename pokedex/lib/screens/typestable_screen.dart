import 'package:flutter/material.dart';
import 'package:pokedex_flutter/constants.dart';
import 'package:pokedex_flutter/api/pokeapi.dart';
import 'package:pokedex_flutter/widgets/my_appbar.dart';
import 'package:pokedex_flutter/widgets/types_pill.dart';

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

