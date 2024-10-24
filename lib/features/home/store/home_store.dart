import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/dependency_injection/app_component.dart';
import 'package:rick_and_morty/domain/use_cases/get_characters_use_case.dart';
import 'package:rick_and_morty/models/character_response/character_response.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final GetCharactersUseCase _getCharactersUseCase = getIt.get<GetCharactersUseCase>();

  @observable
  ObservableFuture<CharacterResponse?>? charactersResponseFuture;

  @observable
  CharacterResponse? charactersResponse;

  @observable
  String? errorMessage;

  @observable
  ObservableList<int> favoriteCharacters = ObservableList<int>.of([]);

  @action
  Future<void> getCharacters() async {
    try {
      charactersResponseFuture = ObservableFuture(_getCharactersUseCase.execute());
      charactersResponse = await charactersResponseFuture;
    } on DioException catch (error) {
      errorMessage = error.message;
    }
  }

  @action
  toggleFavoriteCharacter(int id) {
    if (favoriteCharacters.contains(id)) {
      favoriteCharacters.remove(id);
    } else {
      favoriteCharacters.add(id);
    }
    print(id);
    inspect(favoriteCharacters);
  }
}
