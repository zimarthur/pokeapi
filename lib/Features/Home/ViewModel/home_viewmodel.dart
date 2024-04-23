import 'dart:convert';
import 'package:fluttermon/Common/Managers/palette_generator_manager.dart';
import 'package:fluttermon/Common/Model/pokemon_store.dart';
import 'package:fluttermon/Common/Model/pokemon_type.dart';
import 'package:fluttermon/Features/Home/Repo/home_repo.dart';
import 'package:fluttermon/Remote/network_response.dart';
import 'package:mobx/mobx.dart';
import '../../../Common/Enum/page_status.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  final homeRepo = HomeRepo();

  ObservableList<PokemonStore> pokemons = ObservableList<PokemonStore>();
  @computed
  List<PokemonStore> get filteredPokemons {
    List<PokemonStore> refPokemons = pokemons;
    if (nameFilter.isEmpty) {
      return refPokemons;
    }
    return refPokemons
        .where(
          (pokemon) => pokemon.name.toLowerCase().contains(
                nameFilter.toLowerCase(),
              ),
        )
        .toList();
  }

  ObservableList<PokemonType> pokemonTypes = ObservableList<PokemonType>();

  @observable
  String nameFilter = "";

  @action
  void onNameFilterChanged(String newName) {
    nameFilter = newName;
  }

  @observable
  int totalPokemons = 0;

  @observable
  PageStatus pageStatus = PageStatus.ok;

  String? nextSearchUrl;

  @action
  void initFluttermonApp() {
    pageStatus = PageStatus.loading;
    pokemonTypes.clear();
    pokemons.clear();
    getPokemonTypes();
  }

  void getPokemonTypes({String? nextSearch}) async {
    homeRepo.getPokemonTypes(nextSearch).then((response) {
      if (response.responseStatus == NetworkResponseStatus.success) {
        Map<String, dynamic> decodedResponse = json.decode(
          response.responseBody!,
        );

        final nextSearchUrl = decodedResponse["next"];

        for (var type in decodedResponse["results"]) {
          PaletteColor nextRandonColor =
              PaletteGeneratorManager().generateConstrastColors();
          pokemonTypes.add(
            PokemonType.fromJson(
              type,
              nextRandonColor,
            ),
          );
        }
        if (nextSearchUrl != null) {
          getPokemonTypes(nextSearch: nextSearchUrl);
        } else {
          searchMorePokemons();
        }
      } else {
        pageStatus = PageStatus.error;
      }
    });
  }

  @action
  void searchMorePokemons() {
    pageStatus = PageStatus.loading;
    homeRepo
        .searchMorePokemons(
      nextSearchUrl,
    )
        .then((response) {
      if (response.responseStatus == NetworkResponseStatus.success) {
        Map<String, dynamic> decodedResponse = json.decode(
          response.responseBody!,
        );

        totalPokemons = decodedResponse["count"];
        nextSearchUrl = decodedResponse["next"];

        for (var pokemon in decodedResponse["results"]) {
          final newPokemon = pokemonStoreFromJson(
            pokemon,
          );
          pokemons.add(newPokemon);
          getPokemonInfo(newPokemon);
        }
        pageStatus = PageStatus.ok;
      } else {
        pageStatus = PageStatus.error;
      }
    });
  }

  @action
  void getPokemonInfo(PokemonStore pokemon) {
    pokemon.setFailedToLoadPokemon(false);
    homeRepo.getPokemonInfo(pokemon.completeUrl).then((response) {
      if (response.responseStatus == NetworkResponseStatus.success) {
        Map<String, dynamic> decodedResponse = json.decode(
          response.responseBody!,
        );
        pokemon.getInfoFromJson(decodedResponse, pokemonTypes);
      } else {
        pokemon.setFailedToLoadPokemon(true);
      }
    });
  }
}
