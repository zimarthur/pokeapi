import 'package:flutter/material.dart';
import 'package:fluttermon/Common/Model/pokemon_store.dart';
import 'package:fluttermon/Features/Home/View/home_screen.dart';
import 'package:fluttermon/Features/Pokemon/View/pokemon_screen.dart';
import 'package:fluttermon/named_routes.dart';

void main() {
  runApp(const Fluttermon());
}

class Fluttermon extends StatelessWidget {
  const Fluttermon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case pokemonScreen:
            final arguments = settings.arguments as Map;
            return MaterialPageRoute(
              builder: (context) {
                return PokemonScreen(
                  pokemon: arguments['Pokemon'] as PokemonStore,
                );
              },
            );
          default:
            return null;
        }
      },
      routes: {
        homeScreen: (BuildContext context) => const HomeScreen(),
      },
    );
  }
}
