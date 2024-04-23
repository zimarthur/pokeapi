import 'dart:math';

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletteGeneratorManager {
  Future<PaletteColor?> getPalette(String? imageUrl, {int alpha = 255}) async {
    if (imageUrl == null) {
      return null;
    }
    try {
      PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
        Image.network(
          imageUrl,
        ).image,
      );

      return PaletteColor(
        dominantColor: paletteGenerator.dominantColor?.color.withAlpha(alpha) ??
            Colors.transparent,
        secondaryColor: paletteGenerator.vibrantColor?.color.withAlpha(alpha) ??
            Colors.transparent,
      );
    } catch (e) {
      return PaletteColor(
        dominantColor: Colors.transparent,
        secondaryColor: Colors.transparent,
      );
    }
  }

  PaletteColor generateConstrastColors() {
    final random = Random();
    Color secondaryColor = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );

    final bgLuminance = secondaryColor.computeLuminance();
    Color primaryColor = bgLuminance > 0.5 ? Colors.black : Colors.white;
    return PaletteColor(
      dominantColor: primaryColor,
      secondaryColor: secondaryColor,
    );
  }
}

class PaletteColor {
  Color dominantColor;
  Color secondaryColor;

  PaletteColor({
    required this.dominantColor,
    required this.secondaryColor,
  });

  factory PaletteColor.copyFrom(PaletteColor refPaletteColor) {
    return PaletteColor(
      dominantColor: refPaletteColor.dominantColor,
      secondaryColor: refPaletteColor.secondaryColor,
    );
  }
}
