import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/config/constants.dart';
import 'package:rick_and_morty/data/repositories/favorite_characters/abstract_repository.dart';
import 'package:rick_and_morty/data/repositories/favorite_characters/repository.dart';
import 'package:rick_and_morty/data/repositories/rick_and_morty/abstract_repository.dart';
import 'package:rick_and_morty/data/repositories/rick_and_morty/repository.dart';
import 'package:rick_and_morty/data/sqflite/favorite_characters/database.dart';
import 'package:rick_and_morty/domain/use_cases/add_to_favorite_characters_use_case.dart';
import 'package:rick_and_morty/domain/use_cases/delete_favorite_character_use_case.dart';
import 'package:rick_and_morty/domain/use_cases/get_character_details_use_case.dart';
import 'package:rick_and_morty/domain/use_cases/get_characters_use_case.dart';
import 'package:rick_and_morty/domain/use_cases/get_favorite_characters_use_case.dart';
import 'package:rick_and_morty/features/details/store/details_store.dart';
import 'package:rick_and_morty/features/home/store/home_store.dart';
import 'package:rick_and_morty/services/rick_and_morty_api/api.dart';

final getIt = GetIt.instance;

configureDependencies() {
  _configureNetworkDependencies();
  _configureApiClients();
  _configureRepositories();
  _configureUseCases();
  _configureStores();
}

_configureNetworkDependencies() {
  final Dio dio = Dio();
  getIt.registerSingleton<Dio>(dio);
}

void _configureApiClients() {
  final dio = getIt.get<Dio>();

  final String privateBaseUrl = AppConstants.rickAndMortyApiUrl;

  getIt.registerLazySingleton<RickAndMortyApiClient>(
      () => _initRickAndMortyApiClient(dio: dio, url: privateBaseUrl));
}

void _configureRepositories() {
  final rickAndMortyApiClient = getIt.get<RickAndMortyApiClient>();
  final favoriteCharactersDatabase = FavoriteCharactersDatabase.instance;
  getIt
    ..registerLazySingleton<AbstractFavoriteCharactersRepository>(
      () => FavoriteCharactersRepository(databaseService: favoriteCharactersDatabase),
    )
    ..registerLazySingleton<AbstractRickAndMortyRepository>(
      () => RickAndMortyRepository(apiClient: rickAndMortyApiClient),
    );
}

void _configureUseCases() {
  final rickAndMortyRepository = getIt.get<AbstractRickAndMortyRepository>();
  final favoriteCharactersRepository = getIt.get<AbstractFavoriteCharactersRepository>();

  getIt
    ..registerLazySingleton<DeleteFavoriteCharactersUseCase>(
        () => DeleteFavoriteCharactersUseCase(favoriteCharactersRepository))
    ..registerLazySingleton<AddToFavoriteCharactersUseCase>(
        () => AddToFavoriteCharactersUseCase(favoriteCharactersRepository))
    ..registerLazySingleton<GetFavoriteCharactersUseCase>(
        () => GetFavoriteCharactersUseCase(favoriteCharactersRepository))
    ..registerLazySingleton<GetCharacterDetailsUseCase>(
        () => GetCharacterDetailsUseCase(rickAndMortyRepository))
    ..registerLazySingleton<GetCharactersUseCase>(
        () => GetCharactersUseCase(rickAndMortyRepository));
}

RickAndMortyApiClient _initRickAndMortyApiClient({required Dio dio, String? url}) {
  if (url != null) {
    return RickAndMortyApiClient(dio, baseUrl: url);
  }
  return RickAndMortyApiClient(dio);
}

_configureStores() {
  getIt
    ..registerLazySingleton<DetailsStore>(() => DetailsStore())
    ..registerLazySingleton<HomeStore>(() => HomeStore());
}
