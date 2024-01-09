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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dark Mode',
                          style: whiteNormalStyle,
                        ),
                        Text(
                          'Uses the regular dark theme.',
                          style: tabTitle,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Cambiar el estado al hacer clic
                        setState(() {
                          darkModeIsOn = !darkModeIsOn;
                        });
                      },
                      child: OnOff(isOn: darkModeIsOn),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notificacions',
                          style: whiteNormalStyle,
                        ),
                        Text(
                          'Push notifications are enabled. \n'
                          'You will get notifications about new updates\n'
                          'fixes and promotions',
                          style: tabTitle,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Cambiar el estado al hacer clic
                        setState(() {
                          notificationsIsOn = !notificationsIsOn;
                        });
                      },
                      child: OnOff(isOn: notificationsIsOn),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OnOff extends StatelessWidget {
  const OnOff({
    super.key,
    required this.isOn,
  });

  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'ON',
            style: TextStyle(
              color: isOn ? Colors.red : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: ' / ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'OFF',
            style: TextStyle(
              color: isOn ? Colors.white : Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}