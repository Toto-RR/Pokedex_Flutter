import 'package:flutter/material.dart';
import 'package:pokedex_flutter/constants.dart';
import 'package:pokedex_flutter/screens/search_screen.dart';

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
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
            child: AnimatedPill(
                text: "Search", icon: Icons.search, iconSize: iconSize),
          ),
          AnimatedPill(
              text: "Favourites",
              icon: Icons.favorite_border_outlined,
              iconSize: iconSize),
          AnimatedPill(
              text: "Settings", icon: Icons.settings, iconSize: iconSize),
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
  _AnimatedPillState createState() => _AnimatedPillState();
}

class _AnimatedPillState extends State<AnimatedPill> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
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
