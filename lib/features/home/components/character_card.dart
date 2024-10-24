import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/config/colors.dart';
import 'package:rick_and_morty/config/helpers.dart';
import 'package:rick_and_morty/config/theme.dart';
import 'package:rick_and_morty/dependency_injection/app_component.dart';
import 'package:rick_and_morty/features/home/store/home_store.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/models/character/character.dart';

class CharacterCard extends StatelessWidget {
  static const double _borderRadius = 20;
  static const double _likeContainerSize = 30;

  final Character character;

  CharacterCard({super.key, required this.character});

  final HomeStore _homeStore = getIt.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(_borderRadius),
          onTap: () async {
            await context.push('/details/${character.id}');
          },
          child: SizedBox(
            width: 160,
            height: 215,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(_borderRadius),
                        topRight: Radius.circular(_borderRadius),
                      ),
                      child: Image.network(
                        character.image,
                        frameBuilder: (BuildContext context, Widget child, int? frame,
                            bool wasSynchronouslyLoaded) {
                          if (wasSynchronouslyLoaded || frame != null) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: child,
                            );
                          } else {
                            return const SizedBox(
                              width: 160,
                              height: 160,
                              child: SizedBox(
                                height: 40,
                                width: 40,
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
                            return SizedBox(
                              width: 160,
                              height: 160,
                              child: SizedBox(
                                height: 40,
                                width: 40,
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
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Material(
                        color: AppColors.whiteSmoke,
                        borderRadius: BorderRadius.circular(_likeContainerSize),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(_likeContainerSize),
                          onTap: () {
                            HapticFeedback.lightImpact();
                            _homeStore.toggleFavoriteCharacter(character.id);
                          },
                          child: SizedBox(
                            width: _likeContainerSize,
                            height: _likeContainerSize,
                            child: Center(
                              child: SvgPicture.asset(
                                _homeStore.favoriteCharacters.contains(character.id)
                                    ? Assets.images.liked.path
                                    : Assets.images.unliked.path,
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(
                    character.name,
                    style: FontStyles.bodyBold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
