part of '../theme.dart';

ThemeData createLightTheme() {
  return ThemeData(
    fontFamily: GoogleFonts.kanit(fontWeight: FontWeight.w500).fontFamily,
    textTheme: createTextTheme(),
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.light,
      ThemeTextStyles.light,
      ThemeGradients.light,
    ],
  );
}
