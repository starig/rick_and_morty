import 'package:rick_and_morty/data/sqflite/favorite_characters/schema.dart';

abstract interface class AbstractFavoriteCharactersRepository {
  Future<void> addFavoriteCharacter(FavoriteCharacterModel character);
  Future<List<FavoriteCharacterModel>> getFavoriteCharacters();
  Future<void> deleteFavoriteCharacter(FavoriteCharacterModel character);
}
