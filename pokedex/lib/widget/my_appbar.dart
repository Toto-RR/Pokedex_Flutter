import 'package:flutter/material.dart';
import 'package:pokedex_flutter/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.appBarText});

  final String appBarText;
  Size get preferredSize => const Size.fromHeight(70.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: redPokedex,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      )),
      toolbarHeight: 70,
      title: Text(
        appBarText,
        style: const TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.w300),
      ),
    );
  }

  
}
