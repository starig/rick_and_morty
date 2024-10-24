import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/dependency_injection/app_component.dart';
import 'package:rick_and_morty/features/home/components/character_card.dart';
import 'package:rick_and_morty/features/home/store/home_store.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final Future _getCharactersFuture;
  final HomeStore _homeStore = getIt.get<HomeStore>();

  static const double _borderRadius = 20;
  static const double _horizontalGap = 20;
  static const double _verticalGap = 10;

  @override
  void initState() {
    _getCharactersFuture = _homeStore.getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _getCharactersFuture,
          builder: (BuildContext context, snapshot) {
            return Observer(
              builder: (_) {
                if (_homeStore.charactersResponseFuture?.status == FutureStatus.pending &&
                    _homeStore.charactersResponse?.results == null) {
                  return const Center(child: CircularProgressIndicator());
                } else if (_homeStore.errorMessage != null) {
                  return Center(child: Text('Error: ${_homeStore.errorMessage}'));
                } else if (_homeStore.charactersResponse != null) {
                  final characters = _homeStore.charactersResponse!.results;
                  return SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: _borderRadius,
                      ),
                      child: RefreshIndicator(
                        onRefresh: () {
                          HapticFeedback.heavyImpact();
                          return _homeStore.getCharacters();
                        },
                        child: CustomScrollView(
                          slivers: [
                            SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  final character = characters[index];
                                  return CharacterCard(character: character);
                                },
                                childCount: characters.length,
                              ),
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                mainAxisSpacing: _verticalGap,
                                crossAxisSpacing: _horizontalGap,
                                childAspectRatio: 160 / 215,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(child: Text('No characters found.'));
                }
              },
            );
          }),
    );
  }
}
