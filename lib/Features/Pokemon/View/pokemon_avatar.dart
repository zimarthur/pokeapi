import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttermon/Common/Model/pokemon_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../Common/Utils/constants.dart';

class PokemonAvatar extends StatelessWidget {
  final PokemonStore pokemon;
  const PokemonAvatar({
    required this.pokemon,
    super.key,
  });
  final double imageHeight = 220;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: pokemon.imageFront.toString(),
      child: SizedBox(
        height: imageHeight,
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: pokemon.palette?.dominantColor,
                ),
                height: imageHeight * 0.9,
              ),
            ),
            Positioned.fill(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: white,
                ),
                height: imageHeight * 0.8,
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: pokemon.gif ?? pokemon.imageFront!,
                    height: imageHeight * 0.7,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
