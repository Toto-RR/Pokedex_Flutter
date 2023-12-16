import 'package:flutter/material.dart';
import 'package:pokedex/screens/initial_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeAPI Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black, // Establece el fondo en negro
      ),
      home: const InitialScreen(),
    );
  }
}
void main() async {
  runApp(const MyApp());
}
