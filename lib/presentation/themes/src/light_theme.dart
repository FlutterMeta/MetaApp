part of '../theme.dart';

ThemeData createLightTheme() {
  return ThemeData(
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: createTextTheme(),
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.light,
      ThemeTextStyles.light,
      ThemeGradients.light,
    ],
  );
}
