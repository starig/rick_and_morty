import 'package:flutter/material.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/models/character/character.dart';

double getImageLoadingProgress(ImageChunkEvent loadingProgress) {
  return loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1);
}

String getCharacterStatusIconPath(CharacterStatus value) {
  switch (value) {
    case CharacterStatus.alive:
      return Assets.images.alive.path;
    case CharacterStatus.dead:
      return Assets.images.dead.path;
    case CharacterStatus.unknown:
      return Assets.images.unknownStatus.path;
  }
}

String getCharacterGenderIconPath(CharacterGender value) {
  switch (value) {
    case CharacterGender.female:
      return Assets.images.female.path;
    case CharacterGender.male:
      return Assets.images.male.path;
    case CharacterGender.unknown:
      return Assets.images.unknownGender.path;
    default:
      return Assets.images.unknownGender.path;
  }
}

String getCharacterSpeciesIconPath(CharacterSpecies value) {
  switch (value) {
    case CharacterSpecies.human:
      return Assets.images.human.path;
    case CharacterSpecies.alien:
      return Assets.images.alien.path;
    default:
      return Assets.images.alien.path;
  }
}

extension ToLabelCase on String {
  toLabelCase() {
    if (this.isEmpty) return this; // Return the input if it's empty
    return this[0].toUpperCase() + this.substring(1).toLowerCase();
  }
}
