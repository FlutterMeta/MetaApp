part of '../theme.dart';

const headline1 = TextStyle(fontWeight: FontWeight.w500, fontSize: 20);
const headline2 = TextStyle(fontWeight: FontWeight.w400, fontSize: 18);
const headline3 = TextStyle(fontWeight: FontWeight.w400, fontSize: 16);

abstract class AppColors {
  static const transparent = Colors.transparent;

  static const white = Colors.white;
  static const brighterWhite = Color(0xFFFAFAFA);
  static const brightWhite = Color(0xFFeeeeee);
  static const grey = Color(0xFFE4DFFA);

  static const blue = Colors.blue;
  static const blueGrey = Color(0xFFCACBDF);

  static const purple = Color(0xFF7967D6);
  static const lightPurple = Color(0xFF9A8DE9);
  static const lighterPurple = Color(0xFFb2a4ff);
  static const lightestPurple = Color(0xFFD6CEFF);
}
