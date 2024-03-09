part of '../theme.dart';

ThemeData createDarkTheme() {
  return ThemeData(
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: createTextTheme(),
    scaffoldBackgroundColor: DarkAppColors.darkGrey,
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.dark,
      ThemeTextStyles.dark,
      ThemeGradients.dark,
    ],
  );
}
