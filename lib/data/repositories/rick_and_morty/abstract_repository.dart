import 'package:rick_and_morty/models/character/character.dart';
import 'package:rick_and_morty/models/character_response/character_response.dart';

abstract interface class AbstractRickAndMortyRepository {
  Future<CharacterResponse> getCharacters(int page);

  Future<Character> getCharacterDetails(String id);
}
