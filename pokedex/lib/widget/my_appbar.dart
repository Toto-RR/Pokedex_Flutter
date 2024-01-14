import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.appBarText});

  final String appBarText;
  @override
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            appBarText.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Spacer(),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.home,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ],
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
