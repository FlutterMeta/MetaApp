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
  final Color faqItemBorder;
  final Color faqItemBorderHovered;
  final Color faqItemHoverBackground;
  final Color productsPartnersSectionBackground;
  final Color incomeSectionBackground;
  final Color joinButtonBorder;
  final Color partnersCardBackground;
  final Color partnersCardContentBackground;
  final Color careServiceButton;
  final Color referralBonusCell;
  final Color faqItemArrowFill;
  final Color productsPartnersSectionArrowButton;
  final Color productsPartnersSectionCardBackground;
  final Color productsPartnersSectionCardShadow;
  final Color blogPostBorder;
  final Color blogPostBorderHovered;
  final Color blogPostBackground;
  final Color askButtonBackground;
  final Color partnerButtonBorder;
  final Color postShadow;
  final Color postBackground;

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
    required this.faqItemBorder,
    required this.faqItemHoverBackground,
    required this.productsPartnersSectionBackground,
    required this.incomeSectionBackground,
    required this.joinButtonBorder,
    required this.partnersCardBackground,
    required this.partnersCardContentBackground,
    required this.careServiceButton,
    required this.referralBonusCell,
    required this.faqItemBorderHovered,
    required this.faqItemArrowFill,
    required this.productsPartnersSectionArrowButton,
    required this.productsPartnersSectionCardBackground,
    required this.productsPartnersSectionCardShadow,
    required this.blogPostBorder,
    required this.blogPostBorderHovered,
    required this.blogPostBackground,
    required this.askButtonBackground,
    required this.partnerButtonBorder,
    required this.postShadow,
    required this.postBackground,
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
    Color? faqItemBorder,
    Color? faqItemHoverBackground,
    Color? productsPartnersSectionBackground,
    Color? incomeSectionBackground,
    Color? joinButtonBorder,
    Color? partnersCardBackground,
    Color? partnersCardContentBackground,
    Color? careServiceButton,
    Color? referralBonusCell,
    Color? faqItemBorderHovered,
    Color? faqItemArrowFill,
    Color? productsPartnersSectionArrowButton,
    Color? productsPartnersSectionCardBackground,
    Color? productsPartnersSectionCardShadow,
    Color? blogPostBorder,
    Color? blogPostBorderHovered,
    Color? blogPostBackground,
    Color? askButtonBackground,
    Color? partnerButtonBorder,
    Color? postShadow,
    Color? postBackground,
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
      faqItemBorder: faqItemBorder ?? this.faqItemBorder,
      faqItemHoverBackground:
          faqItemHoverBackground ?? this.faqItemHoverBackground,
      productsPartnersSectionBackground: productsPartnersSectionBackground ??
          this.productsPartnersSectionBackground,
      incomeSectionBackground:
          incomeSectionBackground ?? this.incomeSectionBackground,
      joinButtonBorder: joinButtonBorder ?? this.joinButtonBorder,
      partnersCardBackground:
          partnersCardBackground ?? this.partnersCardBackground,
      partnersCardContentBackground:
          partnersCardContentBackground ?? this.partnersCardContentBackground,
      careServiceButton: careServiceButton ?? this.careServiceButton,
      referralBonusCell: referralBonusCell ?? this.referralBonusCell,
      faqItemBorderHovered: faqItemBorderHovered ?? this.faqItemBorderHovered,
      faqItemArrowFill: faqItemArrowFill ?? this.faqItemArrowFill,
      productsPartnersSectionArrowButton: productsPartnersSectionArrowButton ??
          this.productsPartnersSectionArrowButton,
      productsPartnersSectionCardBackground:
          productsPartnersSectionCardBackground ??
              this.productsPartnersSectionCardBackground,
      productsPartnersSectionCardShadow: productsPartnersSectionCardShadow ??
          this.productsPartnersSectionCardShadow,
      blogPostBorder: blogPostBorder ?? this.blogPostBorder,
      blogPostBorderHovered:
          blogPostBorderHovered ?? this.blogPostBorderHovered,
      blogPostBackground: blogPostBackground ?? this.blogPostBackground,
      askButtonBackground: askButtonBackground ?? this.askButtonBackground,
      partnerButtonBorder: partnerButtonBorder ?? this.partnerButtonBorder,
      postShadow: postShadow ?? this.postShadow,
      postBackground: postBackground ?? this.postBackground,
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
      faqItemBorder: Color.lerp(faqItemBorder, other.faqItemBorder, t)!,
      faqItemHoverBackground:
          Color.lerp(faqItemHoverBackground, other.faqItemHoverBackground, t)!,
      productsPartnersSectionBackground: Color.lerp(
          productsPartnersSectionBackground,
          other.productsPartnersSectionBackground,
          t)!,
      incomeSectionBackground: Color.lerp(
          incomeSectionBackground, other.incomeSectionBackground, t)!,
      joinButtonBorder:
          Color.lerp(joinButtonBorder, other.joinButtonBorder, t)!,
      partnersCardBackground:
          Color.lerp(partnersCardBackground, other.partnersCardBackground, t)!,
      partnersCardContentBackground: Color.lerp(partnersCardContentBackground,
          other.partnersCardContentBackground, t)!,
      careServiceButton:
          Color.lerp(careServiceButton, other.careServiceButton, t)!,
      referralBonusCell:
          Color.lerp(referralBonusCell, other.referralBonusCell, t)!,
      faqItemBorderHovered:
          Color.lerp(faqItemBorderHovered, other.faqItemBorderHovered, t)!,
      faqItemArrowFill:
          Color.lerp(faqItemArrowFill, other.faqItemArrowFill, t)!,
      productsPartnersSectionArrowButton: Color.lerp(
          productsPartnersSectionArrowButton,
          other.productsPartnersSectionArrowButton,
          t)!,
      productsPartnersSectionCardBackground: Color.lerp(
          productsPartnersSectionCardBackground,
          other.productsPartnersSectionCardBackground,
          t)!,
      productsPartnersSectionCardShadow: Color.lerp(
          productsPartnersSectionCardShadow,
          other.productsPartnersSectionCardShadow,
          t)!,
      blogPostBorder: Color.lerp(blogPostBorder, other.blogPostBorder, t)!,
      blogPostBorderHovered:
          Color.lerp(blogPostBorderHovered, other.blogPostBorderHovered, t)!,
      blogPostBackground:
          Color.lerp(blogPostBackground, other.blogPostBackground, t)!,
      askButtonBackground:
          Color.lerp(askButtonBackground, other.askButtonBackground, t)!,
      partnerButtonBorder:
          Color.lerp(partnerButtonBorder, other.partnerButtonBorder, t)!,
      postShadow: Color.lerp(postShadow, other.postShadow, t)!,
      postBackground: Color.lerp(postBackground, other.postBackground, t)!,
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
        faqItemBorder: AppColors.blueGrey,
        faqItemHoverBackground: AppColors.whiteBlue,
        productsPartnersSectionBackground: AppColors.whiteBlue,
        incomeSectionBackground: AppColors.whitePurple,
        joinButtonBorder: AppColors.darkPurple,
        partnersCardBackground: AppColors.purple,
        partnersCardContentBackground: AppColors.white,
        careServiceButton: AppColors.white,
        referralBonusCell: AppColors.whitePurple,
        faqItemBorderHovered: AppColors.transparent,
        faqItemArrowFill: AppColors.purple,
        productsPartnersSectionArrowButton: AppColors.white,
        productsPartnersSectionCardBackground: AppColors.white,
        productsPartnersSectionCardShadow: AppColors.black.withOpacity(0.1),
        blogPostBorder: AppColors.blueGrey,
        blogPostBorderHovered: AppColors.indigo,
        blogPostBackground: AppColors.lighterGrey,
        askButtonBackground: AppColors.white,
        partnerButtonBorder: AppColors.white,
        postShadow: AppColors.black.withOpacity(0.1),
        postBackground: AppColors.white,
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
        faqItemBorder: AppColors.blueGrey,
        faqItemHoverBackground: AppColors.whiteBlue,
        productsPartnersSectionBackground: AppColors.whiteBlue,
        incomeSectionBackground: AppColors.whitePurple,
        joinButtonBorder: AppColors.darkPurple,
        partnersCardBackground: AppColors.purple,
        partnersCardContentBackground: AppColors.white,
        careServiceButton: AppColors.white,
        referralBonusCell: AppColors.whitePurple,
        faqItemBorderHovered: AppColors.transparent,
        faqItemArrowFill: AppColors.purple,
        productsPartnersSectionArrowButton: AppColors.white,
        productsPartnersSectionCardBackground: AppColors.white,
        productsPartnersSectionCardShadow: AppColors.black.withOpacity(0.1),
        blogPostBorder: AppColors.blueGrey,
        blogPostBorderHovered: AppColors.indigo,
        blogPostBackground: AppColors.lighterGrey,
        askButtonBackground: AppColors.white,
        partnerButtonBorder: AppColors.white,
        postShadow: AppColors.black.withOpacity(0.2),
        postBackground: AppColors.white,
      );
}
