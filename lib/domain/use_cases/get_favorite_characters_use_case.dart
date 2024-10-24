import 'package:rick_and_morty/data/repositories/favorite_characters/abstract_repository.dart';
import 'package:rick_and_morty/data/sqflite/favorite_characters/schema.dart';

class GetFavoriteCharactersUseCase {
  final AbstractFavoriteCharactersRepository _favoriteCharactersRepository;

  GetFavoriteCharactersUseCase(this._favoriteCharactersRepository);

  Future<List<FavoriteCharacterModel>> execute() async {
    try {
      final data = await _favoriteCharactersRepository.getFavoriteCharacters();
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
