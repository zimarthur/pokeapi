import 'package:flutter/material.dart';
import 'package:fluttermon/Common/Utils/constants.dart';

class PokemonLoadingError extends StatelessWidget {
  final VoidCallback onTryAgain;
  const PokemonLoadingError({
    required this.onTryAgain,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "There was a problem loading the pokemons",
          style: TextStyle(
            color: darkGray,
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        GestureDetector(
          onTap: () => onTryAgain(),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                defaultBorderRadius,
              ),
              color: yellowSeconday,
            ),
            padding: const EdgeInsets.all(
              defaultPadding / 2,
            ),
            child: const Center(
              child: Text(
                "Try again",
                style: TextStyle(
                  color: white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
