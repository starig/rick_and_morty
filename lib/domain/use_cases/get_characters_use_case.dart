import 'package:rick_and_morty/data/repositories/rick_and_morty/abstract_repository.dart';
import 'package:rick_and_morty/models/character_response/character_response.dart';

class GetCharactersUseCase {
  final AbstractRickAndMortyRepository _rickAndMortyRepository;

  GetCharactersUseCase(this._rickAndMortyRepository);

  Future<CharacterResponse> execute(int page) async {
    try {
      final response = await _rickAndMortyRepository.getCharacters(page);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
