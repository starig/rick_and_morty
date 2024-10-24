class FavoriteCharactersFields {
  static const String tableName = 'favoriteCharacters';
  static const String idType = 'INTEGER PRIMARY KEY';
  static const String intType = 'INTEGER NOT NULL';
  static const String id = '_id';
  static const String characterId = 'character_id';
}

class FavoriteCharacterModel {
  final int characterId;

  FavoriteCharacterModel({required this.characterId});

  Map<String, Object?> toJson() => {
        // FavoriteCharactersFields.id: id,
        FavoriteCharactersFields.characterId: characterId,
      };

  factory FavoriteCharacterModel.fromJson(Map<String, dynamic> json) {
    return FavoriteCharacterModel(
      // id: json[FavoriteCharactersFields.id] as int,
      characterId: json[FavoriteCharactersFields.characterId] as int,
    );
  }

  FavoriteCharacterModel copyWith({
    int? id,
    int? characterId,
  }) =>
      FavoriteCharacterModel(
        // id: id ?? this.id,
        characterId: characterId ?? this.characterId,
      );
}
