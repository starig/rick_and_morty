import 'package:rick_and_morty/data/repositories/rick_and_morty/abstract_repository.dart';
import 'package:rick_and_morty/models/character/character.dart';

class GetCharacterDetailsUseCase {
  final AbstractRickAndMortyRepository _rickAndMortyRepository;

  GetCharacterDetailsUseCase(this._rickAndMortyRepository);

  Future<Character> execute(String id) async {
    try {
      final response = await _rickAndMortyRepository.getCharacterDetails(id);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
