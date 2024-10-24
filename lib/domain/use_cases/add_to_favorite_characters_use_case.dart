import 'package:rick_and_morty/data/repositories/favorite_characters/abstract_repository.dart';
import 'package:rick_and_morty/data/sqflite/favorite_characters/schema.dart';

class AddToFavoriteCharactersUseCase {
  final AbstractFavoriteCharactersRepository _favoriteCharactersRepository;

  AddToFavoriteCharactersUseCase(this._favoriteCharactersRepository);

  Future<void> execute(FavoriteCharacterModel character) async {
    try {
      await _favoriteCharactersRepository.addFavoriteCharacter(character);
    } catch (e) {
      rethrow;
    }
  }
}
