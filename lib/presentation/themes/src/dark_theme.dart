part of '../theme.dart';

ThemeData createDarkTheme() {
  return ThemeData(
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: createTextTheme(),
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.dark,
      ThemeTextStyles.dark,
      ThemeGradients.dark,
    ],
  );
}
