import 'package:flutter/material.dart';
import 'package:fluttermon/Common/Model/pokemon_stat.dart';
import 'package:fluttermon/Common/Model/pokemon_store.dart';
import 'package:fluttermon/Common/Utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermon/Common/Utils/type_extensions.dart';
import 'package:fluttermon/Features/Home/View/pokemon_types_list.dart';
import 'package:fluttermon/Features/Pokemon/View/pokemon_avatar.dart';
import 'package:fluttermon/Features/Pokemon/View/pokemon_description_item.dart';
import 'package:fluttermon/Features/Pokemon/View/pokemon_stat_item.dart';

class PokemonScreen extends StatelessWidget {
  final PokemonStore pokemon;
  const PokemonScreen({
    required this.pokemon,
    super.key,
  });

  final pokemonScreenRoute = '/pokemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: yellowSeconday,
                      ),
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      margin: const EdgeInsets.all(defaultPadding / 2),
                      child: SvgPicture.asset(
                        r"assets/chevron_left.svg",
                        color: white,
                        height: 30,
                      ),
                    ),
                  ),
                ),
                PokemonAvatar(
                  pokemon: pokemon,
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                Text(
                  pokemon.idFormatted,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: darkGray,
                  ),
                ),
                Text(
                  pokemon.name,
                  style: const TextStyle(
                    color: yellowSeconday,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                Center(
                  child: PokemonTypesList(
                    pokemon: pokemon,
                    shrinkWrap: true,
                  ),
                ),
                const SizedBox(
                  height: 2 * defaultPadding,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(
                      defaultBorderRadius,
                    ),
                    border: Border.all(
                      color: divider,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding / 2,
                    vertical: defaultPadding,
                  ),
                  child: Row(
                    children: [
                      PokemonDescriptionItem(
                          icon: "assets/height.svg",
                          title: "height",
                          value: pokemon.height!.formatHeight()),
                      Container(
                        height: 40,
                        width: 1,
                        color: divider,
                      ),
                      PokemonDescriptionItem(
                          icon: "assets/weight.svg",
                          title: "weight",
                          value: pokemon.weight!.formatWeight()),
                      Container(
                        height: 40,
                        width: 1,
                        color: divider,
                      ),
                      PokemonDescriptionItem(
                          icon: "assets/xp.svg",
                          title: "experience",
                          value: pokemon.baseExperience.toString()),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 2 * defaultPadding,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Stats",
                    style: TextStyle(
                      color: yellowSeconday,
                    ),
                  ),
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                ListView.builder(
                    itemCount: pokemon.stats.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      PokemonStat stat = pokemon.stats[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: defaultPadding / 2,
                        ),
                        child: PokemonStatItem(
                          stat: stat,
                          highestPokemonStat: pokemon.highestStat,
                        ),
                      );
                    }),
                const SizedBox(
                  height: defaultPadding,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
