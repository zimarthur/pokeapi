import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermon/Common/Utils/constants.dart';

class PokemonDescriptionItem extends StatelessWidget {
  final String icon;
  final String value;
  final String title;
  const PokemonDescriptionItem({
    required this.icon,
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            height: 25,
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          Text(
            value,
            style: const TextStyle(
              color: yellowSeconday,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: darkGray,
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
