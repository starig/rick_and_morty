import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/config/colors.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';

class CircleBackButton extends StatelessWidget {
  const CircleBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(44),
      color: AppColors.backButtonBg,
      child: InkWell(
        borderRadius: BorderRadius.circular(44),
        onTap: () {
          context.pop();
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            Assets.images.arrowLeft.path,
          ),
        ),
      ),
    );
  }
}
