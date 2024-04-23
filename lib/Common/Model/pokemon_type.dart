import 'package:flutter/material.dart';
import 'package:fluttermon/Common/Managers/palette_generator_manager.dart';

class PokemonType {
  String name;
  String completeUrl;
  Color backgroundColor;
  Color textColor;

  PokemonType({
    required this.name,
    required this.completeUrl,
    required this.backgroundColor,
    required this.textColor,
  });

  factory PokemonType.fromJson(
    Map<String, dynamic> json,
    PaletteColor colors,
  ) {
    return PokemonType(
      name: json["name"],
      completeUrl: json["url"],
      backgroundColor: colors.secondaryColor,
      textColor: colors.dominantColor,
    );
  }
}
