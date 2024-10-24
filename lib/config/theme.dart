import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/config/colors.dart';

final theme = ThemeData(
  useMaterial3: true,
  textTheme: textTheme.apply(
    fontFamily: GoogleFonts.lato().fontFamily,
    bodyColor: AppColors.nero,
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.irisBlue,
    primary: AppColors.irisBlue,
    surface: AppColors.whiteSmoke,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: AppColors.whiteSmoke,
);

const textTheme = TextTheme();

class FontStyles {
  static const double _largeFontSize = 16;
  static const double _mediumFontSize = 14;
  static const double _smallFontSize = 12;

  static const subtitleBold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: _largeFontSize,
  );

  static const bodyBold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: _mediumFontSize,
  );

  static const bodyMedium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: _mediumFontSize,
  );

  static const captionBold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: _smallFontSize,
  );

  static const captionMedium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: _smallFontSize,
  );
}
