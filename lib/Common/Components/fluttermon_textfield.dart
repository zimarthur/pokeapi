import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Utils/constants.dart';

class FluttermonTextfield extends StatelessWidget {
  final String? labelText;
  final Function(String)? onChange;
  final String? iconPath;

  const FluttermonTextfield({
    this.labelText,
    this.onChange,
    this.iconPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        if (onChange != null) {
          onChange!(newText);
        }
      },
      style: const TextStyle(
        color: yellowSeconday,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        prefixIcon: iconPath != null
            ? SvgPicture.asset(
                iconPath!,
                color: darkGray,
                height: 14,
                fit: BoxFit.none,
              )
            : null,
        filled: true,
        fillColor: white,
        contentPadding: const EdgeInsets.all(defaultPadding),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: black,
          fontWeight: FontWeight.w300,
          fontSize: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 2,
            color: divider,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 4,
            color: yellowPrimary,
          ),
        ),
      ),
    );
  }
}
