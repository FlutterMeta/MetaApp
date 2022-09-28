part of '../theme.dart';

ThemeData createDarkTheme() {
  return ThemeData(
    fontFamily: GoogleFonts.kanit(fontWeight: FontWeight.w500).fontFamily,
    textTheme: createTextTheme(),
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.dark,
      ThemeTextStyles.dark,
      ThemeGradients.dark,
    ],
  );
}
