import 'package:fluttermon/Common/Managers/palette_generator_manager.dart';
import 'package:fluttermon/Common/Model/pokemon_stat.dart';
import 'package:fluttermon/Common/Model/pokemon_type.dart';
import 'package:fluttermon/Common/Utils/type_extensions.dart';
import 'package:mobx/mobx.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStore with _$PokemonStore;

PokemonStore pokemonStoreFromJson(Map<String, dynamic> json) {
  return PokemonStore(
    name: json['name'].toString().title(),
    completeUrl: json['url'],
  );
}

abstract class _PokemonStore with Store {
  String name;
  String completeUrl;

  _PokemonStore({
    required this.name,
    required this.completeUrl,
    this.failedLoading = false,
  });

  @observable
  int? id;
  @observable
  int? baseExperience;
  @observable
  int? height;
  @observable
  int? weight;
  @observable
  String? imageFront;
  @observable
  String? imageBack;
  @observable
  String? gif;
  @observable
  PaletteColor? palette;
  @observable
  bool failedLoading;

  ObservableList<PokemonType> types = ObservableList<PokemonType>();
  ObservableList<PokemonStat> stats = ObservableList<PokemonStat>();

  @computed
  int get highestStat => stats
      .reduce((previousValue, element) =>
          element.value > previousValue.value ? element : previousValue)
      .value;

  @computed
  String get idFormatted => id == null ? "" : "#$id";

  @computed
  bool get isLoadingAssets {
    return (imageFront == null || palette == null) && failedLoading == false;
  }

  @action
  void getInfoFromJson(
    Map<String, dynamic> json,
    List<PokemonType> availableTypes,
  ) {
    id = json["id"];
    baseExperience = json["base_experience"];
    height = json["height"];
    weight = json["weight"];
    gif = json["sprites"]["other"]["showdown"]["front_default"];
    imageFront = json["sprites"]["front_default"];
    imageBack = json["sprites"]["back_default"];
    for (var type in json["types"]) {
      types.add(
        availableTypes.firstWhere(
          (pokemonType) => pokemonType.name == type["type"]["name"],
        ),
      );
    }
    for (var stat in json["stats"]) {
      stats.add(
        PokemonStat(
          name: stat["stat"]["name"],
          value: stat["base_stat"],
        ),
      );
    }
    PaletteGeneratorManager().getPalette(imageFront).then(
          (calculatedPalette) => palette = calculatedPalette,
        );
  }

  @action
  void setFailedToLoadPokemon(bool hasFailed) {
    failedLoading = hasFailed;
  }
}
