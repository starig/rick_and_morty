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

  late final _$loadMoreFutureAtom =
      Atom(name: '_HomeStore.loadMoreFuture', context: context);

  @override
  ObservableFuture<CharacterResponse?>? get loadMoreFuture {
    _$loadMoreFutureAtom.reportRead();
    return super.loadMoreFuture;
  }

  @override
  set loadMoreFuture(ObservableFuture<CharacterResponse?>? value) {
    _$loadMoreFutureAtom.reportWrite(value, super.loadMoreFuture, () {
      super.loadMoreFuture = value;
    });
  }

  late final _$loadMoreResponseAtom =
      Atom(name: '_HomeStore.loadMoreResponse', context: context);

  @override
  CharacterResponse? get loadMoreResponse {
    _$loadMoreResponseAtom.reportRead();
    return super.loadMoreResponse;
  }

  @override
  set loadMoreResponse(CharacterResponse? value) {
    _$loadMoreResponseAtom.reportWrite(value, super.loadMoreResponse, () {
      super.loadMoreResponse = value;
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

  late final _$charactersAtom =
      Atom(name: '_HomeStore.characters', context: context);

  @override
  List<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(List<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
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

  late final _$currentPageAtom =
      Atom(name: '_HomeStore.currentPage', context: context);

  @override
  Observable<int> get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(Observable<int> value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$isAllLoadedAtom =
      Atom(name: '_HomeStore.isAllLoaded', context: context);

  @override
  Observable<bool> get isAllLoaded {
    _$isAllLoadedAtom.reportRead();
    return super.isAllLoaded;
  }

  @override
  set isAllLoaded(Observable<bool> value) {
    _$isAllLoadedAtom.reportWrite(value, super.isAllLoaded, () {
      super.isAllLoaded = value;
    });
  }

  late final _$totalPagesAtom =
      Atom(name: '_HomeStore.totalPages', context: context);

  @override
  Observable<int> get totalPages {
    _$totalPagesAtom.reportRead();
    return super.totalPages;
  }

  @override
  set totalPages(Observable<int> value) {
    _$totalPagesAtom.reportWrite(value, super.totalPages, () {
      super.totalPages = value;
    });
  }

  late final _$getCharactersAsyncAction =
      AsyncAction('_HomeStore.getCharacters', context: context);

  @override
  Future<void> getCharacters() {
    return _$getCharactersAsyncAction.run(() => super.getCharacters());
  }

  late final _$loadMoreCharactersAsyncAction =
      AsyncAction('_HomeStore.loadMoreCharacters', context: context);

  @override
  Future<void> loadMoreCharacters() {
    return _$loadMoreCharactersAsyncAction
        .run(() => super.loadMoreCharacters());
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
loadMoreFuture: ${loadMoreFuture},
loadMoreResponse: ${loadMoreResponse},
charactersResponse: ${charactersResponse},
characters: ${characters},
errorMessage: ${errorMessage},
favoriteCharacters: ${favoriteCharacters},
currentPage: ${currentPage},
isAllLoaded: ${isAllLoaded},
totalPages: ${totalPages}
    ''';
  }
}
