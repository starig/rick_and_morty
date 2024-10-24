// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$charactersResponseFutureAtom =
      Atom(name: '_HomeStore.charactersResponseFuture', context: context);

  @override
  ObservableFuture<CharacterResponse?>? get charactersResponseFuture {
    _$charactersResponseFutureAtom.reportRead();
    return super.charactersResponseFuture;
  }

  @override
  set charactersResponseFuture(ObservableFuture<CharacterResponse?>? value) {
    _$charactersResponseFutureAtom
        .reportWrite(value, super.charactersResponseFuture, () {
      super.charactersResponseFuture = value;
    });
  }

  late final _$charactersResponseAtom =
      Atom(name: '_HomeStore.charactersResponse', context: context);

  @override
  CharacterResponse? get charactersResponse {
    _$charactersResponseAtom.reportRead();
    return super.charactersResponse;
  }

  @override
  set charactersResponse(CharacterResponse? value) {
    _$charactersResponseAtom.reportWrite(value, super.charactersResponse, () {
      super.charactersResponse = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_HomeStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$favoriteCharactersAtom =
      Atom(name: '_HomeStore.favoriteCharacters', context: context);

  @override
  ObservableList<int> get favoriteCharacters {
    _$favoriteCharactersAtom.reportRead();
    return super.favoriteCharacters;
  }

  @override
  set favoriteCharacters(ObservableList<int> value) {
    _$favoriteCharactersAtom.reportWrite(value, super.favoriteCharacters, () {
      super.favoriteCharacters = value;
    });
  }

  late final _$getCharactersAsyncAction =
      AsyncAction('_HomeStore.getCharacters', context: context);

  @override
  Future<void> getCharacters() {
    return _$getCharactersAsyncAction.run(() => super.getCharacters());
  }

  late final _$getFavoriteCharactersAsyncAction =
      AsyncAction('_HomeStore.getFavoriteCharacters', context: context);

  @override
  Future<void> getFavoriteCharacters() {
    return _$getFavoriteCharactersAsyncAction
        .run(() => super.getFavoriteCharacters());
  }

  late final _$toggleFavoriteCharacterAsyncAction =
      AsyncAction('_HomeStore.toggleFavoriteCharacter', context: context);

  @override
  Future<void> toggleFavoriteCharacter(int id) {
    return _$toggleFavoriteCharacterAsyncAction
        .run(() => super.toggleFavoriteCharacter(id));
  }

  @override
  String toString() {
    return '''
charactersResponseFuture: ${charactersResponseFuture},
charactersResponse: ${charactersResponse},
errorMessage: ${errorMessage},
favoriteCharacters: ${favoriteCharacters}
    ''';
  }
}
