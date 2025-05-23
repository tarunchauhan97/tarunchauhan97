import 'package:flutter/material.dart';
import 'package:tarundevindia/config/constants/constants.dart';
import 'package:tarundevindia/config/theme/app_colors.dart';

import 'text_theme.dart';

ThemeData createLightTheme(Locale currentLocale) {

  final fontFamily = kShabnamFontFamily;

  // currentLocale ==
  // kPersianLocale ? kShabnamFarsiDigitFontFamily :

  return ThemeData(
    fontFamily: fontFamily,
    primaryColorLight: AppColors.darkBlue,
    primaryColor: AppColors.blue,
    primaryColorDark: AppColors.onlyBlue,
    colorScheme: ColorScheme.light(
      background: Colors.white,
      onBackground: Colors.black,
      secondary: Colors.blue,
      secondaryContainer: Colors.blue.shade700,
    ),
    cardTheme: const CardTheme(
      elevation: 5,
    ),
    textTheme: getBlackTextTheme,
  );
}
