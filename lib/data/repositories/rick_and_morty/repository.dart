import 'package:rick_and_morty/data/repositories/rick_and_morty/abstract_repository.dart';
import 'package:rick_and_morty/models/character/character.dart';
import 'package:rick_and_morty/models/character_response/character_response.dart';
import 'package:rick_and_morty/services/rick_and_morty_api/api.dart';

class RickAndMortyRepository implements AbstractRickAndMortyRepository {
  final RickAndMortyApiClient apiClient;

  RickAndMortyRepository({required this.apiClient});

  @override
  Future<CharacterResponse> getCharacters() async {
    try {
      final response = await apiClient.getCharacters();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Character> getCharacterDetails(String id) async {
    try {
      final response = apiClient.getCharacterDetails(id);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
