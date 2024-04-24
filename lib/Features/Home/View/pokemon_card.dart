import 'package:flutter/material.dart';
import 'package:fluttermon/Common/Utils/constants.dart';
import 'package:fluttermon/Common/Model/pokemon_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermon/Features/Home/View/pokemon_types_list.dart';
import 'package:fluttermon/named_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonCard extends StatefulWidget {
  final PokemonStore pokemon;
  final VoidCallback reloadPokemon;
  const PokemonCard({
    required this.pokemon,
    required this.reloadPokemon,
    super.key,
  });

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  bool showFront = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.pokemon.isLoadingAssets && !widget.pokemon.failedLoading) {
          Navigator.pushNamed(context, pokemonScreen, arguments: {
            "Pokemon": widget.pokemon,
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            defaultBorderRadius,
          ),
          color: white,
          border: Border.all(
            color: divider,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(builder: (layoutContext, layoutConstraints) {
                double pokemonAvatarSectionHeight = layoutConstraints.maxHeight;
                return Observer(builder: (context) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(
                          defaultBorderRadius,
                        ),
                        topRight: Radius.circular(
                          defaultBorderRadius,
                        ),
                      ),
                      color:
                          widget.pokemon.palette?.dominantColor.withAlpha(48),
                    ),
                    height: pokemonAvatarSectionHeight,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () => setState(() {
                              showFront = !showFront;
                            }),
                            child: Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: SvgPicture.asset(
                                r"assets/reverse.svg",
                                height: 25,
                                color: darkGray,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: widget.pokemon.isLoadingAssets
                              ? const SizedBox(
                                  height: 20,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: yellowSeconday,
                                    ),
                                  ),
                                )
                              : widget.pokemon.failedLoading
                                  ? GestureDetector(
                                      onTap: () => widget.reloadPokemon(),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          "assets/refresh.svg",
                                          height: 30,
                                          color: darkGray,
                                        ),
                                      ),
                                    )
                                  : Hero(
                                      tag: widget.pokemon.imageFront.toString(),
                                      child: CachedNetworkImage(
                                        imageUrl: showFront
                                            ? widget.pokemon.imageFront!
                                            : widget.pokemon.imageBack!,
                                      ),
                                    ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding / 4,
                          ),
                          child: PokemonTypesList(
                            shrinkWrap: false,
                            pokemon: widget.pokemon,
                          ),
                        ),
                      ],
                    ),
                  );
                });
              }),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: divider,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 2,
                vertical: defaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Observer(
                    builder: (context) => Text(
                      widget.pokemon.idFormatted,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: darkGray,
                      ),
                    ),
                  ),
                  Text(
                    widget.pokemon.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: yellowSeconday,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
