part of '../theme.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color authButtonFill;
  final Color formFieldFill;
  final Color infoCardBackground;
  final Color roadmapCardBackground;
  final Color navButtonHover;
  final Color webButtonFillColor;
  final Color menuOpacity;
  final Color headerBackground;
  final Color headerShadow;
  final Color footerBackground;
  final Color localeDropdownBackground;
  final Color localeDropdownOpacity;
  final Color fagItemBorder;
  final Color fagItemHoverBackground;
  final Color productsPartnersSectionBackground;

  const ThemeColors({
    required this.authButtonFill,
    required this.formFieldFill,
    required this.infoCardBackground,
    required this.roadmapCardBackground,
    required this.navButtonHover,
    required this.webButtonFillColor,
    required this.menuOpacity,
    required this.headerBackground,
    required this.headerShadow,
    required this.footerBackground,
    required this.localeDropdownOpacity,
    required this.localeDropdownBackground,
    required this.fagItemBorder,
    required this.fagItemHoverBackground,
    required this.productsPartnersSectionBackground,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? authButtonFill,
    Color? formFieldFill,
    Color? infoCardBackground,
    Color? roadmapCardBackground,
    Color? navButtonHover,
    Color? webButtonFillColor,
    Color? menuOpacity,
    Color? headerBackground,
    Color? headerShadow,
    Color? footerBackground,
    Color? localeDropdownOpenedBackground,
    Color? localeDropdownOpacity,
    Color? localeDropdownBackground,
    Color? fagItemBorder,
    Color? fagItemHoverBackground,
    Color? productsPartnersSectionBackground,
  }) {
    return ThemeColors(
      authButtonFill: authButtonFill ?? this.authButtonFill,
      formFieldFill: formFieldFill ?? this.formFieldFill,
      infoCardBackground: infoCardBackground ?? this.infoCardBackground,
      roadmapCardBackground:
          roadmapCardBackground ?? this.roadmapCardBackground,
      navButtonHover: navButtonHover ?? this.navButtonHover,
      webButtonFillColor: webButtonFillColor ?? this.webButtonFillColor,
      menuOpacity: menuOpacity ?? this.menuOpacity,
      headerBackground: headerBackground ?? this.headerBackground,
      headerShadow: headerShadow ?? this.headerShadow,
      footerBackground: footerBackground ?? this.footerBackground,
      localeDropdownOpacity:
          localeDropdownOpacity ?? this.localeDropdownOpacity,
      localeDropdownBackground:
          localeDropdownBackground ?? this.localeDropdownBackground,
      fagItemBorder: fagItemBorder ?? this.fagItemBorder,
      fagItemHoverBackground:
          fagItemHoverBackground ?? this.fagItemHoverBackground,
      productsPartnersSectionBackground: productsPartnersSectionBackground ??
          this.productsPartnersSectionBackground,
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
      authButtonFill: Color.lerp(authButtonFill, other.authButtonFill, t)!,
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
      headerShadow: Color.lerp(headerShadow, other.headerShadow, t)!,
      footerBackground:
          Color.lerp(footerBackground, other.footerBackground, t)!,
      localeDropdownOpacity:
          Color.lerp(localeDropdownOpacity, other.localeDropdownOpacity, t)!,
      localeDropdownBackground: Color.lerp(
          localeDropdownBackground, other.localeDropdownBackground, t)!,
      fagItemBorder: Color.lerp(fagItemBorder, other.fagItemBorder, t)!,
      fagItemHoverBackground:
          Color.lerp(fagItemHoverBackground, other.fagItemHoverBackground, t)!,
      productsPartnersSectionBackground: Color.lerp(
          productsPartnersSectionBackground,
          other.productsPartnersSectionBackground,
          t)!,
    );
  }

  static get light => ThemeColors(
        authButtonFill: AppColors.white,
        formFieldFill: AppColors.brightWhite,
        infoCardBackground: AppColors.grey,
        roadmapCardBackground: AppColors.purple,
        navButtonHover: AppColors.blueGrey,
        webButtonFillColor: AppColors.transparent,
        menuOpacity: AppColors.transparent,
        headerBackground: AppColors.brighterWhite,
        headerShadow: AppColors.grey.withOpacity(0.4),
        footerBackground: AppColors.darkBlue,
        localeDropdownBackground: AppColors.darkerGrey,
        localeDropdownOpacity: AppColors.transparent,
        fagItemBorder: AppColors.blueGrey,
        fagItemHoverBackground: AppColors.whiteBlue,
        productsPartnersSectionBackground: AppColors.whiteBlue,
      );

  static get dark => ThemeColors(
        authButtonFill: AppColors.white,
        formFieldFill: AppColors.brightWhite,
        infoCardBackground: AppColors.grey,
        roadmapCardBackground: AppColors.purple,
        navButtonHover: AppColors.blueGrey,
        webButtonFillColor: AppColors.transparent,
        menuOpacity: AppColors.transparent,
        headerBackground: AppColors.brighterWhite,
        headerShadow: AppColors.grey.withOpacity(0.4),
        footerBackground: AppColors.darkBlue,
        localeDropdownBackground: AppColors.darkerGrey,
        localeDropdownOpacity: AppColors.transparent,
        fagItemBorder: AppColors.blueGrey,
        fagItemHoverBackground: AppColors.whiteBlue,
        productsPartnersSectionBackground: AppColors.whiteBlue,
      );
}
