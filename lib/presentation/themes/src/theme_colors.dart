part of '../theme.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color loginButtonFill;
  final Color formFieldFill;
  final Color infoCardBackground;
  final Color roadmapCardBackground;
  final Color navButtonHover;
  final Color webButtonFillColor;
  final Color menuOpacity;

  const ThemeColors({
    required this.loginButtonFill,
    required this.formFieldFill,
    required this.infoCardBackground,
    required this.roadmapCardBackground,
    required this.navButtonHover,
    required this.webButtonFillColor,
    required this.menuOpacity,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? loginButtonFill,
    Color? formFieldFill,
    Color? infoCardBackground,
    Color? roadmapCardBackground,
    Color? navButtonHover,
    Color? webButtonFillColor,
    Color? menuOpacity,
  }) {
    return ThemeColors(
      loginButtonFill: loginButtonFill ?? this.loginButtonFill,
      formFieldFill: formFieldFill ?? this.formFieldFill,
      infoCardBackground: infoCardBackground ?? this.infoCardBackground,
      roadmapCardBackground:
          roadmapCardBackground ?? this.roadmapCardBackground,
      navButtonHover: navButtonHover ?? this.navButtonHover,
      webButtonFillColor: webButtonFillColor ?? this.webButtonFillColor,
      menuOpacity: menuOpacity ?? this.menuOpacity,
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
      infoCardBackground:
          Color.lerp(infoCardBackground, other.infoCardBackground, t)!,
      roadmapCardBackground:
          Color.lerp(roadmapCardBackground, other.roadmapCardBackground, t)!,
      navButtonHover: Color.lerp(navButtonHover, other.navButtonHover, t)!,
      webButtonFillColor:
          Color.lerp(webButtonFillColor, other.webButtonFillColor, t)!,
      menuOpacity: Color.lerp(menuOpacity, other.menuOpacity, t)!,
    );
  }

  static get light => const ThemeColors(
        loginButtonFill: AppColors.white,
        formFieldFill: AppColors.brighterWhite,
        infoCardBackground: AppColors.grey,
        roadmapCardBackground: AppColors.purple,
        navButtonHover: AppColors.blueGrey,
        webButtonFillColor: AppColors.transparent,
        menuOpacity: AppColors.transparent,
      );

  static get dark => const ThemeColors(
        loginButtonFill: AppColors.white,
        formFieldFill: AppColors.brighterWhite,
        infoCardBackground: AppColors.grey,
        roadmapCardBackground: AppColors.purple,
        navButtonHover: AppColors.blueGrey,
        webButtonFillColor: AppColors.transparent,
        menuOpacity: AppColors.transparent,
      );
}
