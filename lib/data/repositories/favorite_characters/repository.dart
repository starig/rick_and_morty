import 'package:rick_and_morty/data/repositories/favorite_characters/abstract_repository.dart';
import 'package:rick_and_morty/data/sqflite/favorite_characters/database.dart';
import 'package:rick_and_morty/data/sqflite/favorite_characters/schema.dart';

class FavoriteCharactersRepository implements AbstractFavoriteCharactersRepository {
  final FavoriteCharactersDatabase databaseService;

  FavoriteCharactersRepository({required this.databaseService});

  @override
  Future<void> addFavoriteCharacter(FavoriteCharacterModel character) async {
    try {
      final db = await databaseService.database;
      await db.insert(FavoriteCharactersFields.tableName, character.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteFavoriteCharacter(FavoriteCharacterModel character) async {
    try {
      final db = await databaseService.database;
      await db.delete(
        FavoriteCharactersFields.tableName,
        where: '${FavoriteCharactersFields.characterId} = ?',
        whereArgs: [character.characterId],
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<FavoriteCharacterModel>> getFavoriteCharacters() async {
    try {
      final db = await databaseService.database;
      final data = await db.query(FavoriteCharactersFields.tableName);
      List<FavoriteCharacterModel> characters = [];
      for (var item in data) {
        characters = [...characters, FavoriteCharacterModel.fromJson(item)];
      }
      return characters;
    } catch (e) {
      rethrow;
    }
  }
}
