// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  Computed<List<PokemonStore>>? _$filteredPokemonsComputed;

  @override
  List<PokemonStore> get filteredPokemons => (_$filteredPokemonsComputed ??=
          Computed<List<PokemonStore>>(() => super.filteredPokemons,
              name: 'HomeViewModelBase.filteredPokemons'))
      .value;

  late final _$nameFilterAtom =
      Atom(name: 'HomeViewModelBase.nameFilter', context: context);

  @override
  String get nameFilter {
    _$nameFilterAtom.reportRead();
    return super.nameFilter;
  }

  @override
  set nameFilter(String value) {
    _$nameFilterAtom.reportWrite(value, super.nameFilter, () {
      super.nameFilter = value;
    });
  }

  late final _$totalPokemonsAtom =
      Atom(name: 'HomeViewModelBase.totalPokemons', context: context);

  @override
  int get totalPokemons {
    _$totalPokemonsAtom.reportRead();
    return super.totalPokemons;
  }

  @override
  set totalPokemons(int value) {
    _$totalPokemonsAtom.reportWrite(value, super.totalPokemons, () {
      super.totalPokemons = value;
    });
  }

  late final _$pageStatusAtom =
      Atom(name: 'HomeViewModelBase.pageStatus', context: context);

  @override
  PageStatus get pageStatus {
    _$pageStatusAtom.reportRead();
    return super.pageStatus;
  }

  @override
  set pageStatus(PageStatus value) {
    _$pageStatusAtom.reportWrite(value, super.pageStatus, () {
      super.pageStatus = value;
    });
  }

  late final _$HomeViewModelBaseActionController =
      ActionController(name: 'HomeViewModelBase', context: context);

  @override
  void onNameFilterChanged(String newName) {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.onNameFilterChanged');
    try {
      return super.onNameFilterChanged(newName);
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initFluttermonApp() {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.initFluttermonApp');
    try {
      return super.initFluttermonApp();
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchMorePokemons() {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.searchMorePokemons');
    try {
      return super.searchMorePokemons();
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getPokemonInfo(PokemonStore pokemon) {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.getPokemonInfo');
    try {
      return super.getPokemonInfo(pokemon);
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameFilter: ${nameFilter},
totalPokemons: ${totalPokemons},
pageStatus: ${pageStatus},
filteredPokemons: ${filteredPokemons}
    ''';
  }
}
