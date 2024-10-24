import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/dependency_injection/app_component.dart';
import 'package:rick_and_morty/domain/use_cases/get_character_details_use_case.dart';
import 'package:rick_and_morty/models/character/character.dart';

part 'details_store.g.dart';

class DetailsStore = _DetailsStore with _$DetailsStore;

abstract class _DetailsStore with Store {
  final GetCharacterDetailsUseCase _getCharacterDetailsUseCase =
      getIt.get<GetCharacterDetailsUseCase>();

  @observable
  ObservableFuture<Character?>? characterDetailsResponseFuture;

  @observable
  Character? characterDetails;

  @observable
  String? errorMessage;

  @action
  Future<void> getCharacterDetails(String id) async {
    try {
      characterDetailsResponseFuture = ObservableFuture(_getCharacterDetailsUseCase.execute(id));
      characterDetails = await characterDetailsResponseFuture;
    } on DioException catch (error) {
      errorMessage = error.message;
    }
  }
}
