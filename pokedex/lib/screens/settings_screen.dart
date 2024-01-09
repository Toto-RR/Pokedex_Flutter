import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/widget/my_appbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkModeIsOn = true;
  bool notificationsIsOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(appBarText: 'Settings'),
      backgroundColor: darkPokedex,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Interface language',
                  style: whiteNormalStyle,
                ),
                Text(
                  'English (US)',
                  style: tabTitle,
                ),
                const SizedBox(height: 20),
                Text(
                  'Menus, buttons, etc. will be displayed in this language.',
                  style: tabTitle,
                ),
                const SizedBox(height: 20),
                Text(
                  'Data Language',
                  style: whiteNormalStyle,
                ),
                Text(
                  'English (US)',
                  style: tabTitle,
                ),
                const SizedBox(height: 40),
                Text(
                  'Names, descriptions, etc. will be displayed in this language (soon available).',
                  style: tabTitle,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
