part of '../theme.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color loginButtonFill;
  final Color formFieldFill;
  final Color infoCardBackground;
  final Color roadmapCardBackground;
  final Color navButtonHover;
  final Color webButtonFillColor;
  final Color menuOpacity;
  final Color headerBackground;

  const ThemeColors({
    required this.loginButtonFill,
    required this.formFieldFill,
    required this.infoCardBackground,
    required this.roadmapCardBackground,
    required this.navButtonHover,
    required this.webButtonFillColor,
    required this.menuOpacity,
    required this.headerBackground,
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
    Color? headerBackground,
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
      headerBackground: headerBackground ?? this.headerBackground,
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
      headerBackground:
          Color.lerp(headerBackground, other.headerBackground, t)!,
    );
  }

  static get light => ThemeColors(
        loginButtonFill: AppColors.white,
        formFieldFill: AppColors.brightWhite,
        infoCardBackground: AppColors.grey,
        roadmapCardBackground: AppColors.purple,
        navButtonHover: AppColors.blueGrey,
        webButtonFillColor: AppColors.transparent,
        menuOpacity: AppColors.transparent,
        headerBackground: AppColors.brighterWhite,
      );

  static get dark => ThemeColors(
        loginButtonFill: AppColors.white,
        formFieldFill: AppColors.brightWhite,
        infoCardBackground: AppColors.grey,
        roadmapCardBackground: AppColors.purple,
        navButtonHover: AppColors.blueGrey,
        webButtonFillColor: AppColors.transparent,
        menuOpacity: AppColors.transparent,
        headerBackground: AppColors.brighterWhite,
      );
}
