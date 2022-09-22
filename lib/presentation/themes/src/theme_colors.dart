part of '../theme.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color loginButtonFill;
  final Color formFieldFill;

  const ThemeColors({
    required this.loginButtonFill,
    required this.formFieldFill,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? loginButtonFill,
    Color? formFieldFill,
  }) {
    return ThemeColors(
      loginButtonFill: loginButtonFill ?? this.loginButtonFill,
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
      loginButtonFill: Color.lerp(loginButtonFill, other.loginButtonFill, t)!,
      formFieldFill: Color.lerp(formFieldFill, other.formFieldFill, t)!,
    );
  }

  static get light => const ThemeColors(
        loginButtonFill: AppColors.white,
        formFieldFill: AppColors.brighterWhite,
      );

  static get dark => const ThemeColors(
        loginButtonFill: AppColors.white,
        formFieldFill: AppColors.brighterWhite,
      );
}
