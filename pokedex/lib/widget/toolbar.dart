import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/screens/favorite_screen.dart';
import 'package:pokedex/screens/search_screen.dart';
import 'package:pokedex/screens/settings_screen.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = 30;
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            child: AnimatedPill(
                text: "Search", icon: Icons.search, iconSize: iconSize),
          ),
           GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesScreen()), // Abre FavoritesScreen
              );
            },
            child: AnimatedPill(
              text: "Favourites",
              icon: Icons.favorite_border_outlined,
              iconSize: iconSize,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
            child: AnimatedPill(
                text: "Settings", icon: Icons.settings, iconSize: iconSize),
          ),
        ],
      ),
    );
  }
}

class AnimatedPill extends StatefulWidget {
  const AnimatedPill({
    Key? key,
    required this.iconSize,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final double iconSize;
  final String text;
  final IconData icon;

  @override
  State<AnimatedPill> createState() => _AnimatedPillState();
}

class _AnimatedPillState extends State<AnimatedPill> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: Colors.white,
          ),
          color: isHovered ? redPokedex : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon,
                size: widget.iconSize,
                color: isHovered ? Colors.white : Colors.red),
            const SizedBox(width: 5),
            Text(widget.text,
                style: isHovered ? whiteNormalStyleBig : whiteNormalStyle,
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  void _onHover(bool hover) {
    setState(() {
      isHovered = hover;
    });
  }
}
