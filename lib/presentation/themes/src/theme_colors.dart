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
  final Color promotionSectionCardBackground;
  final Color homeAskButtonBorder;
  final Color homeInvestmentSectionArrow;
  final Color homeInvestmentSectionDivider;
  final Color homeInvestmentChipBorder;
  final Color revenueSectionDivider;
  final Color revenueSectionRateCardBorder;
  final Color revenueSectionArrowIcon;
  final Color revenueSectionHoverColor;
  final Color directionsCardBackground;
  final Color directionsCardsSectionBackground;
  final Color directionCardIcon;
  final Color directionCardIconBackground;
  final Color directionsScaffoldBackground;
  final Color termsButtonFillColor;
  final Color directionsJoinButtonBorder;
  final Color productsScaffoldBackground;
  final Color dashboardSideMenuSelectedItem;
  final Color dashboardSideMenuUnselectedItem;
  final Color background;
  final Color onBackground;
  final Color primary;
  final Color primaryVariant;
  final Color secondary;
  final Color secondaryVariant;
  final Color transparent;

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
    required this.promotionSectionCardBackground,
    required this.homeAskButtonBorder,
    required this.homeInvestmentSectionArrow,
    required this.homeInvestmentSectionDivider,
    required this.homeInvestmentChipBorder,
    required this.revenueSectionDivider,
    required this.revenueSectionRateCardBorder,
    required this.revenueSectionArrowIcon,
    required this.revenueSectionHoverColor,
    required this.directionsCardBackground,
    required this.directionsCardsSectionBackground,
    required this.directionCardIcon,
    required this.directionCardIconBackground,
    required this.directionsScaffoldBackground,
    required this.termsButtonFillColor,
    required this.directionsJoinButtonBorder,
    required this.productsScaffoldBackground,
    required this.dashboardSideMenuSelectedItem,
    required this.dashboardSideMenuUnselectedItem,
    required this.background,
    required this.primary,
    required this.secondary,
    required this.primaryVariant,
    required this.secondaryVariant,
    required this.onBackground,
    required this.transparent,
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
    Color? promotionSectionCardBackground,
    Color? homeAskButtonBorder,
    Color? homeInvestmentSectionArrow,
    Color? homeInvestmentSectionDivider,
    Color? homeInvestmentChipBorder,
    Color? revenueSectionDivider,
    Color? revenueSectionRateCardBorder,
    Color? revenueSectionArrowIcon,
    Color? revenueSectionHoverColor,
    Color? directionsCardBackground,
    Color? directionsCardsSectionBackground,
    Color? directionCardIcon,
    Color? directionCardIconBackground,
    Color? directionsScaffoldBackground,
    Color? termsButtonFillColor,
    Color? directionsJoinButtonBorder,
    Color? productsScaffoldBackground,
    Color? dashboardSideMenuSelectedItem,
    Color? dashboardSideMenuUnselectedItem,
    Color? background,
    Color? primary,
    Color? secondary,
    Color? primaryVariant,
    Color? secondaryVariant,
    Color? onBackground,
    Color? transparent,
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
      promotionSectionCardBackground:
          promotionSectionCardBackground ?? this.promotionSectionCardBackground,
      homeAskButtonBorder: homeAskButtonBorder ?? this.homeAskButtonBorder,
      homeInvestmentSectionArrow:
          homeInvestmentSectionArrow ?? this.homeInvestmentSectionArrow,
      homeInvestmentSectionDivider:
          homeInvestmentSectionDivider ?? this.homeInvestmentSectionDivider,
      homeInvestmentChipBorder:
          homeInvestmentChipBorder ?? this.homeInvestmentChipBorder,
      revenueSectionDivider:
          revenueSectionDivider ?? this.revenueSectionDivider,
      revenueSectionRateCardBorder:
          revenueSectionRateCardBorder ?? this.revenueSectionRateCardBorder,
      revenueSectionArrowIcon:
          revenueSectionArrowIcon ?? this.revenueSectionArrowIcon,
      revenueSectionHoverColor:
          revenueSectionHoverColor ?? this.revenueSectionHoverColor,
      directionsCardBackground:
          directionsCardBackground ?? this.directionsCardBackground,
      directionsCardsSectionBackground: directionsCardsSectionBackground ??
          this.directionsCardsSectionBackground,
      directionCardIcon: directionCardIcon ?? this.directionCardIcon,
      directionCardIconBackground:
          directionCardIconBackground ?? this.directionCardIconBackground,
      directionsScaffoldBackground:
          directionsScaffoldBackground ?? this.directionsScaffoldBackground,
      termsButtonFillColor: termsButtonFillColor ?? this.termsButtonFillColor,
      directionsJoinButtonBorder:
          directionsJoinButtonBorder ?? this.directionsJoinButtonBorder,
      productsScaffoldBackground:
          productsScaffoldBackground ?? this.productsScaffoldBackground,
      dashboardSideMenuSelectedItem:
          dashboardSideMenuSelectedItem ?? this.dashboardSideMenuSelectedItem,
      dashboardSideMenuUnselectedItem: dashboardSideMenuUnselectedItem ??
          this.dashboardSideMenuUnselectedItem,
      background: background ?? this.background,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      primaryVariant: primaryVariant ?? this.primaryVariant,
      secondaryVariant: secondaryVariant ?? this.secondaryVariant,
      onBackground: onBackground ?? this.onBackground,
      transparent: transparent ?? this.transparent,
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
      promotionSectionCardBackground: Color.lerp(promotionSectionCardBackground,
          other.promotionSectionCardBackground, t)!,
      homeAskButtonBorder:
          Color.lerp(homeAskButtonBorder, other.homeAskButtonBorder, t)!,
      homeInvestmentSectionArrow: Color.lerp(
          homeInvestmentSectionArrow, other.homeInvestmentSectionArrow, t)!,
      homeInvestmentSectionDivider: Color.lerp(
          homeInvestmentSectionDivider, other.homeInvestmentSectionDivider, t)!,
      homeInvestmentChipBorder: Color.lerp(
          homeInvestmentChipBorder, other.homeInvestmentChipBorder, t)!,
      revenueSectionDivider:
          Color.lerp(revenueSectionDivider, other.revenueSectionDivider, t)!,
      revenueSectionRateCardBorder: Color.lerp(
          revenueSectionRateCardBorder, other.revenueSectionRateCardBorder, t)!,
      revenueSectionArrowIcon: Color.lerp(
          revenueSectionArrowIcon, other.revenueSectionArrowIcon, t)!,
      revenueSectionHoverColor: Color.lerp(
          revenueSectionHoverColor, other.revenueSectionHoverColor, t)!,
      directionsCardBackground: Color.lerp(
          directionsCardBackground, other.directionsCardBackground, t)!,
      directionsCardsSectionBackground: Color.lerp(
          directionsCardsSectionBackground,
          other.directionsCardsSectionBackground,
          t)!,
      directionCardIcon:
          Color.lerp(directionCardIcon, other.directionCardIcon, t)!,
      directionCardIconBackground: Color.lerp(
          directionCardIconBackground, other.directionCardIconBackground, t)!,
      directionsScaffoldBackground: Color.lerp(
          directionsScaffoldBackground, other.directionsScaffoldBackground, t)!,
      termsButtonFillColor:
          Color.lerp(termsButtonFillColor, other.termsButtonFillColor, t)!,
      directionsJoinButtonBorder: Color.lerp(
          directionsJoinButtonBorder, other.directionsJoinButtonBorder, t)!,
      productsScaffoldBackground: Color.lerp(
          productsScaffoldBackground, other.productsScaffoldBackground, t)!,
      dashboardSideMenuSelectedItem: Color.lerp(dashboardSideMenuSelectedItem,
          other.dashboardSideMenuSelectedItem, t)!,
      dashboardSideMenuUnselectedItem: Color.lerp(
          dashboardSideMenuUnselectedItem,
          other.dashboardSideMenuUnselectedItem,
          t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryVariant: Color.lerp(primaryVariant, other.primaryVariant, t)!,
      secondaryVariant:
          Color.lerp(secondaryVariant, other.secondaryVariant, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
      background: Color.lerp(background, other.background, t)!,
    );
  }

  static get light => ThemeColors(
        authButtonFill: AppColors.white,
        formFieldFill: AppColors.brightWhite,
        infoCardBackground: AppColors.turquoise.withOpacity(0.1),
        roadmapCardBackground: AppColors.indigo,
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
        incomeSectionBackground: AppColors.indigo.withOpacity(0.1),
        joinButtonBorder: AppColors.darkIndigo,
        partnersCardBackground: AppColors.indigo,
        partnersCardContentBackground: AppColors.white,
        careServiceButton: AppColors.white,
        referralBonusCell: AppColors.indigo.withOpacity(0.1),
        faqItemBorderHovered: AppColors.transparent,
        faqItemArrowFill: AppColors.indigo,
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
        promotionSectionCardBackground: AppColors.white,
        homeAskButtonBorder: AppColors.indigo,
        homeInvestmentSectionArrow: AppColors.white,
        homeInvestmentSectionDivider: AppColors.white,
        homeInvestmentChipBorder: AppColors.white,
        revenueSectionDivider: AppColors.grey,
        revenueSectionRateCardBorder: AppColors.grey,
        revenueSectionArrowIcon: AppColors.lighterBlack,
        revenueSectionHoverColor: AppColors.transparent,
        directionsCardBackground: AppColors.aquamarine.withOpacity(0.2),
        directionsCardsSectionBackground: AppColors.lightGrey,
        directionCardIcon: AppColors.indigo,
        directionCardIconBackground: AppColors.white,
        directionsScaffoldBackground: AppColors.white,
        termsButtonFillColor: AppColors.white,
        directionsJoinButtonBorder: AppColors.white,
        productsScaffoldBackground: AppColors.white,
        dashboardSideMenuSelectedItem: AppColors.indigo,
        dashboardSideMenuUnselectedItem: AppColors.greyish,
        primary: AppColors.indigo,
        primaryVariant: AppColors.darkIndigo,
        secondary: AppColors.turquoise,
        secondaryVariant: AppColors.seaGreen,
        transparent: AppColors.transparent,
        background: AppColors.white,
        onBackground: AppColors.black,
      );

  static get dark => ThemeColors(
        authButtonFill: AppColors.white,
        formFieldFill: AppColors.brightWhite,
        infoCardBackground: AppColors.turquoise.withOpacity(0.1),
        roadmapCardBackground: AppColors.indigo,
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
        incomeSectionBackground: AppColors.indigo.withOpacity(0.1),
        joinButtonBorder: AppColors.darkIndigo,
        partnersCardBackground: AppColors.indigo,
        partnersCardContentBackground: AppColors.white,
        careServiceButton: AppColors.white,
        referralBonusCell: AppColors.indigo.withOpacity(0.1),
        faqItemBorderHovered: AppColors.transparent,
        faqItemArrowFill: AppColors.indigo,
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
        promotionSectionCardBackground: AppColors.white,
        homeAskButtonBorder: AppColors.indigo,
        homeInvestmentSectionArrow: AppColors.white,
        homeInvestmentSectionDivider: AppColors.white,
        homeInvestmentChipBorder: AppColors.white,
        revenueSectionDivider: AppColors.grey,
        revenueSectionRateCardBorder: AppColors.grey,
        revenueSectionArrowIcon: AppColors.lighterBlack,
        revenueSectionHoverColor: AppColors.transparent,
        directionsCardBackground: AppColors.aquamarine.withOpacity(0.2),
        directionsCardsSectionBackground: AppColors.lightGrey,
        directionCardIcon: AppColors.indigo,
        directionCardIconBackground: AppColors.white,
        directionsScaffoldBackground: AppColors.white,
        termsButtonFillColor: AppColors.white,
        directionsJoinButtonBorder: AppColors.white,
        productsScaffoldBackground: AppColors.white,
        dashboardSideMenuSelectedItem: AppColors.indigo,
        dashboardSideMenuUnselectedItem: AppColors.greyish,
        primary: AppColors.indigo,
        primaryVariant: AppColors.darkIndigo,
        secondary: AppColors.turquoise,
        secondaryVariant: AppColors.seaGreen,
        transparent: AppColors.transparent,
        background: AppColors.white,
        onBackground: AppColors.black,
      );
}
