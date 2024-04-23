import 'package:flutter/material.dart';
import 'package:fluttermon/Common/Model/pokemon_stat.dart';

import '../../../Common/Utils/Constants.dart';

class PokemonStatItem extends StatefulWidget {
  final PokemonStat stat;
  final int highestPokemonStat;
  const PokemonStatItem({
    required this.stat,
    required this.highestPokemonStat,
    super.key,
  });

  @override
  State<PokemonStatItem> createState() => _PokemonStatItemState();
}

class _PokemonStatItemState extends State<PokemonStatItem> {
  bool finishBuild = false;
  final animationDurations = const Duration(milliseconds: 500);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        setState(() {
          finishBuild = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.stat.name,
          style: const TextStyle(
            color: darkGray,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: defaultPadding / 4,
        ),
        SizedBox(
          height: 20,
          child: LayoutBuilder(builder: (layoutContext, layoutConstraint) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: divider,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    color: white,
                  ),
                  width: layoutConstraint.maxWidth,
                  height: layoutConstraint.maxHeight,
                ),
                AnimatedContainer(
                  duration: animationDurations,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    color: yellowSeconday,
                  ),
                  width: finishBuild
                      ? layoutConstraint.maxWidth *
                          (widget.stat.value / widget.highestPokemonStat)
                      : 0,
                  height: layoutConstraint.maxHeight,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding / 2,
                  ),
                  child: Text(
                    widget.stat.value.toString(),
                    style: const TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
