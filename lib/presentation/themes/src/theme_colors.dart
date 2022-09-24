part of '../theme.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color loginButtonFill;
  final Color formFieldFill;
  final Color itemsGreyBackground;
  final Color mainPurple;

  const ThemeColors({
    required this.loginButtonFill,
    required this.formFieldFill,
    required this.itemsGreyBackground,
    required this.mainPurple,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? loginButtonFill,
    Color? formFieldFill,
    Color? itemsGreyBackground,
    Color? mainPurple,
  }) {
    return ThemeColors(
      loginButtonFill: loginButtonFill ?? this.loginButtonFill,
      formFieldFill: formFieldFill ?? this.formFieldFill,
      itemsGreyBackground: itemsGreyBackground ?? this.itemsGreyBackground,
      mainPurple: mainPurple ?? this.mainPurple,
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
      itemsGreyBackground:
          Color.lerp(itemsGreyBackground, other.itemsGreyBackground, t)!,
      mainPurple: Color.lerp(mainPurple, other.mainPurple, t)!,
    );
  }

  static get light => const ThemeColors(
      loginButtonFill: AppColors.white,
      formFieldFill: AppColors.brighterWhite,
      itemsGreyBackground: AppColors.grey,
      mainPurple: AppColors.purple);

  static get dark => const ThemeColors(
      loginButtonFill: AppColors.white,
      formFieldFill: AppColors.brighterWhite,
      itemsGreyBackground: AppColors.grey,
      mainPurple: AppColors.purple);
}
