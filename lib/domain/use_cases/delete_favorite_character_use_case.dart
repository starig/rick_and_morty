import 'package:rick_and_morty/data/repositories/favorite_characters/abstract_repository.dart';
import 'package:rick_and_morty/data/sqflite/favorite_characters/schema.dart';

class DeleteFavoriteCharactersUseCase {
  final AbstractFavoriteCharactersRepository _favoriteCharactersRepository;

  DeleteFavoriteCharactersUseCase(this._favoriteCharactersRepository);

  Future<void> execute(FavoriteCharacterModel character) async {
    try {
      await _favoriteCharactersRepository.deleteFavoriteCharacter(character);
    } catch (e) {
      rethrow;
    }
  }
}
