import 'package:flutter/material.dart';

import 'app.colors.dart';
import 'dark.colors.dart';
import 'light.colors.dart';

class AppTheme {
  static LightColors lightColors = LightColors();
  static DarkColors darkColors = DarkColors();

  static ThemeData lightTheme = ThemeData.light().copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      elevation: 0.5,
      backgroundColor: AppColors.white,
      centerTitle: false,
      titleTextStyle: TextStyle(color: lightColors.getPrimary(), fontSize: 16),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      elevation: 0,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.white,
    ),
    cardTheme: CardTheme(color: lightColors.getThirdly()),
    colorScheme: ColorScheme.light(primary: lightColors.getThirdly()),
    scaffoldBackgroundColor: lightColors.getThirdly(),
    textTheme: lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      elevation: 0.5,
      iconTheme: IconThemeData(color: darkColors.getPrimary()),
      backgroundColor: lightColors.getThirdly(),
      centerTitle: false,
      titleTextStyle: TextStyle(color: lightColors.getPrimary(), fontSize: 16),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: lightColors.getThirdly(),
    ),
    buttonTheme: const ButtonThemeData(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
    ),
    cardTheme: CardTheme(color: lightColors.getSecondary()),
    colorScheme: ColorScheme.dark(primary: darkColors.getThirdly()),
    scaffoldBackgroundColor: darkColors.getThirdly(),
    textTheme: darkTextTheme,
  );

  static TextTheme lightTextTheme = const TextTheme().copyWith(
    // Bold
    titleLarge: TextStyle(
      fontFamily: "SF-Pro",
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: lightColors.getThirdly(),
    ),
    // Medium
    titleMedium: TextStyle(
      fontFamily: "SF-Pro",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: lightColors.getThirdly(),
    ),
    // Regular
    titleSmall: TextStyle(
      fontFamily: "SF-Pro",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: lightColors.getThirdly(),
    ),
  );

  static TextTheme darkTextTheme = const TextTheme().copyWith(
    // Bold
    titleLarge: TextStyle(
      fontFamily: "SF-Pro",
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: darkColors.getThirdly(),
    ),
    // Medium
    titleMedium: TextStyle(
      fontFamily: "SF-Pro",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: darkColors.getThirdly(),
    ),
    // Regular
    titleSmall: TextStyle(
      fontFamily: "SF-Pro",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: darkColors.getThirdly(),
    ),
  );
}
