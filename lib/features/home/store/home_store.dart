import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/data/sqflite/favorite_characters/schema.dart';
import 'package:rick_and_morty/dependency_injection/app_component.dart';
import 'package:rick_and_morty/domain/use_cases/add_to_favorite_characters_use_case.dart';
import 'package:rick_and_morty/domain/use_cases/delete_favorite_character_use_case.dart';
import 'package:rick_and_morty/domain/use_cases/get_characters_use_case.dart';
import 'package:rick_and_morty/domain/use_cases/get_favorite_characters_use_case.dart';
import 'package:rick_and_morty/models/character/character.dart';
import 'package:rick_and_morty/models/character_response/character_response.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final GetCharactersUseCase _getCharactersUseCase = getIt.get<GetCharactersUseCase>();
  final GetFavoriteCharactersUseCase _getFavoriteCharactersUseCase =
      getIt.get<GetFavoriteCharactersUseCase>();
  final AddToFavoriteCharactersUseCase _addToFavoriteCharactersUseCase =
      getIt.get<AddToFavoriteCharactersUseCase>();
  final DeleteFavoriteCharactersUseCase _deleteFavoriteCharactersUseCase =
      getIt.get<DeleteFavoriteCharactersUseCase>();

  @observable
  ObservableFuture<CharacterResponse?>? charactersResponseFuture;

  @observable
  ObservableFuture<CharacterResponse?>? loadMoreFuture;

  @observable
  CharacterResponse? loadMoreResponse;

  @observable
  CharacterResponse? charactersResponse;

  @observable
  List<Character> characters = ObservableList<Character>.of([]);

  @observable
  String? errorMessage;

  @observable
  ObservableList<int> favoriteCharacters = ObservableList<int>.of([]);

  @observable
  Observable<int> currentPage = Observable<int>(1);

  @observable
  Observable<bool> isAllLoaded = Observable<bool>(false);

  @observable
  Observable<int> totalPages = Observable<int>(0);

  @action
  Future<void> getCharacters() async {
    currentPage.value = 1;
    try {
      charactersResponseFuture = ObservableFuture(_getCharactersUseCase.execute(currentPage.value));
      charactersResponse = await charactersResponseFuture;
      characters = charactersResponse!.results;
      totalPages.value = charactersResponse!.info.pages;
      await getFavoriteCharacters();
    } on DioException catch (error) {
      errorMessage = error.message;
    }
  }

  @action
  Future<void> loadMoreCharacters() async {
    currentPage.value++;
    try {
      loadMoreFuture = ObservableFuture(_getCharactersUseCase.execute(currentPage.value));
      loadMoreResponse = await loadMoreFuture;

      for (var item in loadMoreResponse!.results) {
        characters = [...characters, item];
      }

      await getFavoriteCharacters();
    } on DioException catch (error) {
      errorMessage = error.message;
    }
    if (currentPage == totalPages) {
      isAllLoaded.value = true;
    }
  }

  @action
  Future<void> getFavoriteCharacters() async {
    try {
      final data = await _getFavoriteCharactersUseCase.execute();
      ObservableList<int> _favoritesCharacters = ObservableList<int>.of([]);
      for (var item in data) {
        _favoritesCharacters.add(item.characterId);
      }
      favoriteCharacters = _favoritesCharacters;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @action
  Future<void> toggleFavoriteCharacter(int id) async {
    final favoriteCharacter = FavoriteCharacterModel(characterId: id);
    if (favoriteCharacters.contains(id)) {
      await _deleteFavoriteCharactersUseCase.execute(favoriteCharacter);
    } else {
      await _addToFavoriteCharactersUseCase.execute(favoriteCharacter);
    }
    await getFavoriteCharacters();
  }
}
