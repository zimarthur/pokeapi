import 'package:flutter/material.dart';
import 'package:fluttermon/Common/Utils/Constants.dart';
import 'package:fluttermon/Common/Enum/page_status.dart';
import 'package:fluttermon/Common/Components/loading.dart';
import 'package:fluttermon/Features/Home/View/home_header.dart';
import 'package:fluttermon/Features/Home/View/pokemon_grid.dart';
import 'package:fluttermon/Features/Home/View/pokemon_loading_error.dart';
import 'package:fluttermon/Features/Home/ViewModel/home_viewmodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final viewModel = HomeViewModel();

  @override
  void initState() {
    viewModel.initFluttermonApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellowSeconday,
      body: Observer(
        builder: (context) {
          return Stack(
            children: [
              Column(
                children: [
                  HomeHeader(
                    onChange: viewModel.onNameFilterChanged,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2,
                      ),
                      decoration: const BoxDecoration(
                        color: background,
                      ),
                      child: viewModel.pageStatus == PageStatus.error &&
                              viewModel.pokemons.isEmpty
                          ? PokemonLoadingError(
                              onTryAgain: () => viewModel.initFluttermonApp(),
                            )
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Pokemons",
                                      style: TextStyle(
                                        color: yellowSeconday,
                                      ),
                                    ),
                                    Text(
                                      "${viewModel.pokemons.length} from ${viewModel.totalPokemons}",
                                      style: const TextStyle(
                                        color: darkGray,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: PokemonGrid(
                                    pokemons: viewModel.filteredPokemons,
                                    reachedEndOfGridCallback: () {
                                      if (viewModel.pageStatus !=
                                          PageStatus.error) {
                                        viewModel.searchMorePokemons();
                                      }
                                    },
                                    reloadPokemon: (pokemon) =>
                                        viewModel.getPokemonInfo(pokemon),
                                  ),
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                if (viewModel.pageStatus == PageStatus.error &&
                                    viewModel.pokemons.isNotEmpty)
                                  PokemonLoadingError(
                                    onTryAgain: () =>
                                        viewModel.searchMorePokemons(),
                                  ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
              if (viewModel.pageStatus.isLoading) const Loading()
            ],
          );
        },
      ),
    );
  }
}
