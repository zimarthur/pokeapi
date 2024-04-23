import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Common/Components/fluttermon_textfield.dart';
import '../../../Common/Utils/Constants.dart';

class HomeHeader extends StatelessWidget {
  final Function(String) onChange;
  const HomeHeader({
    required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          color: background,
          child: Container(
            height: 100,
            decoration: const BoxDecoration(
              color: yellowSeconday,
            ),
            child: SafeArea(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      r"assets/flutter_bird.png",
                      height: 60,
                    ),
                    const SizedBox(
                      width: defaultPadding,
                    ),
                    SvgPicture.asset(
                      r"assets/fluttermon_title.svg",
                      width: width * 0.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      color: background,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: yellowSeconday,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(
                              2 * defaultBorderRadius,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: yellowSeconday,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: background,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              2 * defaultBorderRadius,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 2),
                  child: FluttermonTextfield(
                    labelText: "Search pokemon",
                    onChange: onChange,
                    iconPath: "assets/search.svg",
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
