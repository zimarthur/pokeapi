// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonStore on _PokemonStore, Store {
  Computed<int>? _$highestStatComputed;

  @override
  int get highestStat =>
      (_$highestStatComputed ??= Computed<int>(() => super.highestStat,
              name: '_PokemonStore.highestStat'))
          .value;
  Computed<String>? _$idFormattedComputed;

  @override
  String get idFormatted =>
      (_$idFormattedComputed ??= Computed<String>(() => super.idFormatted,
              name: '_PokemonStore.idFormatted'))
          .value;
  Computed<bool>? _$isLoadingAssetsComputed;

  @override
  bool get isLoadingAssets =>
      (_$isLoadingAssetsComputed ??= Computed<bool>(() => super.isLoadingAssets,
              name: '_PokemonStore.isLoadingAssets'))
          .value;

  late final _$idAtom = Atom(name: '_PokemonStore.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$baseExperienceAtom =
      Atom(name: '_PokemonStore.baseExperience', context: context);

  @override
  int? get baseExperience {
    _$baseExperienceAtom.reportRead();
    return super.baseExperience;
  }

  @override
  set baseExperience(int? value) {
    _$baseExperienceAtom.reportWrite(value, super.baseExperience, () {
      super.baseExperience = value;
    });
  }

  late final _$heightAtom =
      Atom(name: '_PokemonStore.height', context: context);

  @override
  int? get height {
    _$heightAtom.reportRead();
    return super.height;
  }

  @override
  set height(int? value) {
    _$heightAtom.reportWrite(value, super.height, () {
      super.height = value;
    });
  }

  late final _$weightAtom =
      Atom(name: '_PokemonStore.weight', context: context);

  @override
  int? get weight {
    _$weightAtom.reportRead();
    return super.weight;
  }

  @override
  set weight(int? value) {
    _$weightAtom.reportWrite(value, super.weight, () {
      super.weight = value;
    });
  }

  late final _$imageFrontAtom =
      Atom(name: '_PokemonStore.imageFront', context: context);

  @override
  String? get imageFront {
    _$imageFrontAtom.reportRead();
    return super.imageFront;
  }

  @override
  set imageFront(String? value) {
    _$imageFrontAtom.reportWrite(value, super.imageFront, () {
      super.imageFront = value;
    });
  }

  late final _$imageBackAtom =
      Atom(name: '_PokemonStore.imageBack', context: context);

  @override
  String? get imageBack {
    _$imageBackAtom.reportRead();
    return super.imageBack;
  }

  @override
  set imageBack(String? value) {
    _$imageBackAtom.reportWrite(value, super.imageBack, () {
      super.imageBack = value;
    });
  }

  late final _$gifAtom = Atom(name: '_PokemonStore.gif', context: context);

  @override
  String? get gif {
    _$gifAtom.reportRead();
    return super.gif;
  }

  @override
  set gif(String? value) {
    _$gifAtom.reportWrite(value, super.gif, () {
      super.gif = value;
    });
  }

  late final _$paletteAtom =
      Atom(name: '_PokemonStore.palette', context: context);

  @override
  PaletteColor? get palette {
    _$paletteAtom.reportRead();
    return super.palette;
  }

  @override
  set palette(PaletteColor? value) {
    _$paletteAtom.reportWrite(value, super.palette, () {
      super.palette = value;
    });
  }

  late final _$failedLoadingAtom =
      Atom(name: '_PokemonStore.failedLoading', context: context);

  @override
  bool get failedLoading {
    _$failedLoadingAtom.reportRead();
    return super.failedLoading;
  }

  @override
  set failedLoading(bool value) {
    _$failedLoadingAtom.reportWrite(value, super.failedLoading, () {
      super.failedLoading = value;
    });
  }

  late final _$_PokemonStoreActionController =
      ActionController(name: '_PokemonStore', context: context);

  @override
  void getInfoFromJson(
      Map<String, dynamic> json, List<PokemonType> availableTypes) {
    final _$actionInfo = _$_PokemonStoreActionController.startAction(
        name: '_PokemonStore.getInfoFromJson');
    try {
      return super.getInfoFromJson(json, availableTypes);
    } finally {
      _$_PokemonStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFailedToLoadPokemon(bool hasFailed) {
    final _$actionInfo = _$_PokemonStoreActionController.startAction(
        name: '_PokemonStore.setFailedToLoadPokemon');
    try {
      return super.setFailedToLoadPokemon(hasFailed);
    } finally {
      _$_PokemonStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
baseExperience: ${baseExperience},
height: ${height},
weight: ${weight},
imageFront: ${imageFront},
imageBack: ${imageBack},
gif: ${gif},
palette: ${palette},
failedLoading: ${failedLoading},
highestStat: ${highestStat},
idFormatted: ${idFormatted},
isLoadingAssets: ${isLoadingAssets}
    ''';
  }
}
