part of '../theme.dart';

const headline1 = TextStyle(
    fontWeight: FontWeight.w400, fontSize: 20, color: AppColors.white);
const headline3 = TextStyle(fontSize: 16, color: AppColors.white);

abstract class AppColors {
  static const white = Colors.white;
  static const formFieldFillColor = Color.fromARGB(255, 237, 232, 232);
  static const formBackgroundGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [
      0.4,
      0.8,
    ],
    colors: [
      Color.fromARGB(255, 131, 101, 182),
      Color.fromARGB(255, 177, 143, 223),
    ],
  );
}

///some UI settings
abstract class UISettings {
  ///default button style
  static final buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
  );
}
