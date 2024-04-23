import 'package:flutter/material.dart';
import 'package:fluttermon/Common/Model/pokemon_store.dart';

import '../../../Common/Model/pokemon_type.dart';
import '../../../Common/Utils/constants.dart';

class PokemonTypesList extends StatelessWidget {
  final PokemonStore pokemon;
  final bool shrinkWrap;
  const PokemonTypesList({
    required this.pokemon,
    required this.shrinkWrap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
          itemCount: pokemon.types.length,
          shrinkWrap: shrinkWrap,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            PokemonType type = pokemon.types[index];
            return Container(
              margin: const EdgeInsets.only(
                left: defaultPadding / 2,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 2,
              ),
              decoration: BoxDecoration(
                color: type.backgroundColor,
                borderRadius: BorderRadius.circular(
                  defaultBorderRadius,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                type.name,
                style: TextStyle(
                  color: type.textColor,
                  fontSize: 12,
                ),
              ),
            );
          }),
    );
  }
}
