// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsStore on _DetailsStore, Store {
  late final _$characterDetailsResponseFutureAtom = Atom(
      name: '_DetailsStore.characterDetailsResponseFuture', context: context);

  @override
  ObservableFuture<Character?>? get characterDetailsResponseFuture {
    _$characterDetailsResponseFutureAtom.reportRead();
    return super.characterDetailsResponseFuture;
  }

  @override
  set characterDetailsResponseFuture(ObservableFuture<Character?>? value) {
    _$characterDetailsResponseFutureAtom
        .reportWrite(value, super.characterDetailsResponseFuture, () {
      super.characterDetailsResponseFuture = value;
    });
  }

  late final _$characterDetailsAtom =
      Atom(name: '_DetailsStore.characterDetails', context: context);

  @override
  Character? get characterDetails {
    _$characterDetailsAtom.reportRead();
    return super.characterDetails;
  }

  @override
  set characterDetails(Character? value) {
    _$characterDetailsAtom.reportWrite(value, super.characterDetails, () {
      super.characterDetails = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_DetailsStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$getCharacterDetailsAsyncAction =
      AsyncAction('_DetailsStore.getCharacterDetails', context: context);

  @override
  Future<void> getCharacterDetails(String id) {
    return _$getCharacterDetailsAsyncAction
        .run(() => super.getCharacterDetails(id));
  }

  @override
  String toString() {
    return '''
characterDetailsResponseFuture: ${characterDetailsResponseFuture},
characterDetails: ${characterDetails},
errorMessage: ${errorMessage}
    ''';
  }
}
