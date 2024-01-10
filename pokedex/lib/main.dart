import 'package:flutter/material.dart';
import 'package:pokedex/provider/favorite_provider.dart';
import 'package:pokedex/screens/initial_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()), // Reemplaza FavoriteProvider con el nombre real de tu provider
        // Agrega más proveedores según sea necesario
      ],
      child: MaterialApp(
        title: 'PokeAPI Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const InitialScreen(),
      ),
    );
  }
}

void main() async {
  runApp(const MyApp());
}
