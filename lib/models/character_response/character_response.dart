import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/models/character/character.dart';

part 'character_response.g.dart';

@JsonSerializable()
class CharacterResponse {
  final CharacterResponseInfo info;
  final List<Character> results;

  CharacterResponse({
    required this.info,
    required this.results,
  });

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterResponseToJson(this);
}

@JsonSerializable()
class CharacterResponseInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  CharacterResponseInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory CharacterResponseInfo.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterResponseInfoToJson(this);
}
