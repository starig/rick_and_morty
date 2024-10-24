import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/config/helpers.dart';
import 'package:rick_and_morty/dependency_injection/app_component.dart';
import 'package:rick_and_morty/features/components/circle_back_button.dart';
import 'package:rick_and_morty/features/details/components/details_item.dart';
import 'package:rick_and_morty/features/details/store/details_store.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/models/character/character.dart';

class DetailsView extends StatefulWidget {
  final int id;

  const DetailsView({super.key, required this.id});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late final Future _getCharacterDetailsFuture;
  final DetailsStore _detailsStore = getIt.get<DetailsStore>();

  static const double _leadingWidth = 76;
  static const double _horizontalPadding = 20;
  static const double _expandedHeight = 260;
  static const double _loaderSize = 40;

  @override
  void initState() {
    _getCharacterDetailsFuture = _detailsStore.getCharacterDetails(widget.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getCharacterDetailsFuture,
        builder: (BuildContext context, snapshot) {
          return Observer(
            builder: (_) {
              if (_detailsStore.characterDetailsResponseFuture?.status == FutureStatus.pending) {
                return const Center(child: CircularProgressIndicator());
              } else if (_detailsStore.errorMessage != null) {
                return Center(child: Text('Error: ${_detailsStore.errorMessage}'));
              } else if (_detailsStore.characterDetails != null) {
                final Character character = _detailsStore.characterDetails!;
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      leadingWidth: _leadingWidth,
                      leading: const Padding(
                        padding: EdgeInsets.only(left: _horizontalPadding),
                        child: CircleBackButton(),
                      ),
                      expandedHeight: _expandedHeight,
                      flexibleSpace: Stack(
                        children: [
                          SizedBox.expand(
                            child: Image.network(
                              character.image,
                              fit: BoxFit.cover,
                              frameBuilder: (BuildContext context, Widget child, int? frame,
                                  bool wasSynchronouslyLoaded) {
                                if (wasSynchronouslyLoaded || frame != null) {
                                  return Container(
                                    child: child,
                                  );
                                } else {
                                  return const Center(
                                    child: SizedBox(
                                      height: _loaderSize,
                                      width: _loaderSize,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  );
                                }
                              },
                              loadingBuilder: (
                                BuildContext context,
                                Widget child,
                                ImageChunkEvent? loadingProgress,
                              ) {
                                if (loadingProgress == null) {
                                  return child; // Image is fully loaded, return the image
                                } else {
                                  return Center(
                                    child: SizedBox(
                                      height: _loaderSize,
                                      width: _loaderSize,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress.expectedTotalBytes != null
                                              ? getImageLoadingProgress(loadingProgress)
                                              : 0,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
                      sliver: SliverList.list(
                        children: [
                          DetailsItem(
                            iconPath: Assets.images.information.path,
                            label: 'Name',
                            value: character.name.toLabelCase(),
                          ),
                          DetailsItem(
                            iconPath: getCharacterStatusIconPath(character.status),
                            label: 'Status',
                            value: character.status.name.toLabelCase(),
                          ),
                          DetailsItem(
                            iconPath: getCharacterSpeciesIconPath(character.species),
                            label: 'Species',
                            value: character.species.name.toLabelCase(),
                          ),
                          DetailsItem(
                            iconPath: getCharacterGenderIconPath(character.gender),
                            label: 'Gender',
                            value: character.gender.name.toLabelCase(),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return const Center(child: Text('No character found.'));
              }
            },
          );
        },
      ),
    );
  }
}
