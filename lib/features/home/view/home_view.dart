import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/dependency_injection/app_component.dart';
import 'package:rick_and_morty/features/home/components/character_card.dart';
import 'package:rick_and_morty/features/home/store/home_store.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final Future _getCharactersFuture;
  final HomeStore _homeStore = getIt.get<HomeStore>();
  final ScrollController _scrollController = ScrollController();

  static const double _borderRadius = 20;
  static const double _horizontalGap = 20;
  static const double _verticalGap = 10;

  @override
  void initState() {
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        if (!_homeStore.isAllLoaded.value) {
          await _homeStore.loadMoreCharacters();
        }
      }
    });
    _getCharactersFuture = _homeStore.getCharacters();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Network error...'),
                        TextButton(
                          onPressed: () async {
                            await _homeStore.getCharacters();
                          },
                          child: const Text("Try again"),
                        ),
                      ],
                    ),
                  );
                } else if (_homeStore.charactersResponse != null) {
                  return SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: _borderRadius,
                      ),
                      child: RefreshIndicator(
                        onRefresh: () async {
                          HapticFeedback.heavyImpact();
                          return _homeStore.getCharacters();
                        },
                        child: CustomScrollView(
                          controller: _scrollController,
                          slivers: [
                            SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  final character = _homeStore.characters[index];
                                  return CharacterCard(character: character);
                                },
                                childCount: _homeStore.characters.length,
                              ),
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                mainAxisSpacing: _verticalGap,
                                crossAxisSpacing: _horizontalGap,
                                childAspectRatio: 160 / 215,
                              ),
                            ),
                            if (_homeStore.loadMoreFuture?.status == FutureStatus.pending)
                              const SliverToBoxAdapter(
                                child: Center(
                                  child: CircularProgressIndicator(),
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
