part of '../theme.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color test;
  final Color formFieldFill;

  const ThemeColors({
    required this.test,
    required this.formFieldFill,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? test,
    Color? formFieldFill,
  }) {
    return ThemeColors(
      test: test ?? this.test,
      formFieldFill: formFieldFill ?? this.formFieldFill,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      test: Color.lerp(test, other.test, t)!,
      formFieldFill: Color.lerp(formFieldFill, other.formFieldFill, t)!,
    );
  }

  static get light => const ThemeColors(
        test: AppColors.white,
        formFieldFill: Color.fromRGBO(225, 225, 225, 1),
      );

  static get dark => const ThemeColors(
        test: AppColors.white,
        formFieldFill: Color.fromRGBO(225, 225, 225, 1),
      );
}
