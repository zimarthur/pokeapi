import 'package:flutter/material.dart';
import 'package:fluttermon/Common/Model/pokemon_store.dart';
import 'package:fluttermon/Features/Home/View/pokemon_card.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../Common/Utils/Constants.dart';

class PokemonGrid extends StatefulWidget {
  final List<PokemonStore> pokemons;
  final VoidCallback reachedEndOfGridCallback;
  final Function(PokemonStore) reloadPokemon;

  const PokemonGrid({
    required this.pokemons,
    required this.reachedEndOfGridCallback,
    required this.reloadPokemon,
    super.key,
  });

  @override
  State<PokemonGrid> createState() => _PokemonGridState();
}

class _PokemonGridState extends State<PokemonGrid> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.position.pixels) {
      widget.reachedEndOfGridCallback();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
          mainAxisExtent: 250,
        ),
        controller: _scrollController,
        itemCount: widget.pokemons.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return PokemonCard(
            pokemon: widget.pokemons[index],
            reloadPokemon: () => widget.reloadPokemon(
              widget.pokemons[index],
            ),
          );
        },
      ),
    );
  }
}
