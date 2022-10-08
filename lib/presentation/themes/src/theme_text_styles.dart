part of '../theme.dart';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  final TextStyle test;
  final TextStyle loginFormText;
  final TextStyle loginFormTitle;
  final TextStyle loginFormTextBold;
  final TextStyle authButtonText;
  final TextStyle authFormHint;
  final TextStyle authFormError;
  final TextStyle multiMetaUniverseTitle;
  final TextStyle metaverseThatUnitesTitle;
  final TextStyle fromFiftyDollarsTitle;
  final TextStyle leadershipBonusesTitle;
  final TextStyle profitToPartnersTitle;
  final TextStyle homePagePurpleBodyText;
  final TextStyle accountTitle;
  final TextStyle revelantInfoTitle;
  final TextStyle purpleButtonText;
  final TextStyle registrationFormText;
  final TextStyle registrationFormTitle;
  final TextStyle registrationFormTextBold;
  final TextStyle forgotPasswordFormText;
  final TextStyle forgotPasswordFormTitle;
  final TextStyle forgotPasswordFormTextBold;
  final TextStyle haveAnAccount;
  final TextStyle videoTitle;
  final TextStyle footerNavColumnTitle;
  final TextStyle footerNavColumnText;
  final TextStyle footerWeCareAboutYou;
  final TextStyle hoveredFooterNavColumnText;

  ThemeTextStyles({
    required this.test,
    required this.loginFormText,
    required this.loginFormTitle,
    required this.loginFormTextBold,
    required this.authButtonText,
    required this.authFormHint,
    required this.authFormError,
    required this.multiMetaUniverseTitle,
    required this.metaverseThatUnitesTitle,
    required this.fromFiftyDollarsTitle,
    required this.leadershipBonusesTitle,
    required this.profitToPartnersTitle,
    required this.homePagePurpleBodyText,
    required this.accountTitle,
    required this.revelantInfoTitle,
    required this.purpleButtonText,
    required this.registrationFormText,
    required this.registrationFormTitle,
    required this.registrationFormTextBold,
    required this.forgotPasswordFormText,
    required this.forgotPasswordFormTitle,
    required this.forgotPasswordFormTextBold,
    required this.haveAnAccount,
    required this.videoTitle,
    required this.footerNavColumnTitle,
    required this.footerNavColumnText,
    required this.footerWeCareAboutYou,
    required this.hoveredFooterNavColumnText,
  });

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    TextStyle? test,
    TextStyle? loginFormText,
    TextStyle? loginFormTitle,
    TextStyle? loginFormTextBold,
    TextStyle? authButtonText,
    TextStyle? authFormHint,
    TextStyle? authFormError,
    TextStyle? multiMetaUniverseTitle,
    TextStyle? metaverseThatUnitesTitle,
    TextStyle? fromFiftyDollarsTitle,
    TextStyle? leadershipBonusesTitle,
    TextStyle? profitToPartnersTitle,
    TextStyle? accountTitle,
    TextStyle? homePagePurpleBodyText,
    TextStyle? revelantInfoTitle,
    TextStyle? purpleButtonText,
    TextStyle? registrationFormText,
    TextStyle? registrationFormTitle,
    TextStyle? registrationFormTextBold,
    TextStyle? forgotPasswordFormText,
    TextStyle? forgotPasswordFormTitle,
    TextStyle? forgotPasswordFormTextBold,
    TextStyle? haveAnAccount,
    TextStyle? videoTitle,
    TextStyle? footerNavColumnTitle,
    TextStyle? footerNavColumnText,
    TextStyle? footerWeCareAboutYou,
    TextStyle? hoveredFooterNavColumnText,
  }) {
    return ThemeTextStyles(
      test: test ?? this.test,
      loginFormText: loginFormText ?? this.loginFormText,
      loginFormTitle: loginFormTitle ?? this.loginFormTitle,
      loginFormTextBold: loginFormTextBold ?? this.loginFormTextBold,
      authButtonText: authButtonText ?? this.authButtonText,
      authFormHint: authFormHint ?? this.authFormHint,
      authFormError: authFormError ?? this.authFormError,
      multiMetaUniverseTitle:
          multiMetaUniverseTitle ?? this.multiMetaUniverseTitle,
      metaverseThatUnitesTitle:
          metaverseThatUnitesTitle ?? this.metaverseThatUnitesTitle,
      fromFiftyDollarsTitle:
          fromFiftyDollarsTitle ?? this.fromFiftyDollarsTitle,
      leadershipBonusesTitle:
          leadershipBonusesTitle ?? this.leadershipBonusesTitle,
      profitToPartnersTitle:
          profitToPartnersTitle ?? this.profitToPartnersTitle,
      accountTitle: accountTitle ?? this.accountTitle,
      homePagePurpleBodyText:
          homePagePurpleBodyText ?? this.homePagePurpleBodyText,
      revelantInfoTitle: revelantInfoTitle ?? this.revelantInfoTitle,
      purpleButtonText: purpleButtonText ?? this.purpleButtonText,
      registrationFormText: registrationFormText ?? this.registrationFormText,
      registrationFormTitle:
          registrationFormTitle ?? this.registrationFormTitle,
      registrationFormTextBold:
          registrationFormTextBold ?? this.registrationFormTextBold,
      forgotPasswordFormText:
          forgotPasswordFormText ?? this.forgotPasswordFormText,
      forgotPasswordFormTitle:
          forgotPasswordFormTitle ?? this.forgotPasswordFormTitle,
      forgotPasswordFormTextBold:
          forgotPasswordFormTextBold ?? this.forgotPasswordFormTextBold,
      haveAnAccount: haveAnAccount ?? this.haveAnAccount,
      videoTitle: videoTitle ?? this.videoTitle,
      footerNavColumnTitle: footerNavColumnTitle ?? this.footerNavColumnTitle,
      footerNavColumnText: footerNavColumnText ?? this.footerNavColumnText,
      footerWeCareAboutYou: footerWeCareAboutYou ?? this.footerWeCareAboutYou,
      hoveredFooterNavColumnText:
          hoveredFooterNavColumnText ?? this.hoveredFooterNavColumnText,
    );
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(
    ThemeExtension<ThemeTextStyles>? other,
    double t,
  ) {
    if (other is! ThemeTextStyles) {
      return this;
    }

    return ThemeTextStyles(
      test: TextStyle.lerp(test, other.test, t)!,
      loginFormText: TextStyle.lerp(loginFormText, other.loginFormText, t)!,
      loginFormTitle: TextStyle.lerp(loginFormTitle, other.loginFormTitle, t)!,
      loginFormTextBold:
          TextStyle.lerp(loginFormTextBold, other.loginFormTextBold, t)!,
      authButtonText: TextStyle.lerp(authButtonText, other.authButtonText, t)!,
      authFormHint: TextStyle.lerp(authFormHint, other.authFormHint, t)!,
      authFormError: TextStyle.lerp(authFormError, other.authFormError, t)!,
      multiMetaUniverseTitle: TextStyle.lerp(
          multiMetaUniverseTitle, other.multiMetaUniverseTitle, t)!,
      fromFiftyDollarsTitle: TextStyle.lerp(
          fromFiftyDollarsTitle, other.fromFiftyDollarsTitle, t)!,
      leadershipBonusesTitle: TextStyle.lerp(
          leadershipBonusesTitle, other.leadershipBonusesTitle, t)!,
      profitToPartnersTitle: TextStyle.lerp(
          profitToPartnersTitle, other.profitToPartnersTitle, t)!,
      metaverseThatUnitesTitle: TextStyle.lerp(
          metaverseThatUnitesTitle, other.metaverseThatUnitesTitle, t)!,
      accountTitle: TextStyle.lerp(accountTitle, other.accountTitle, t)!,
      homePagePurpleBodyText: TextStyle.lerp(
          homePagePurpleBodyText, other.homePagePurpleBodyText, t)!,
      revelantInfoTitle:
          TextStyle.lerp(revelantInfoTitle, other.revelantInfoTitle, t)!,
      purpleButtonText:
          TextStyle.lerp(purpleButtonText, other.purpleButtonText, t)!,
      registrationFormText:
          TextStyle.lerp(registrationFormText, other.registrationFormText, t)!,
      registrationFormTitle: TextStyle.lerp(
          registrationFormTitle, other.registrationFormTitle, t)!,
      registrationFormTextBold: TextStyle.lerp(
          registrationFormTextBold, other.registrationFormTextBold, t)!,
      forgotPasswordFormText: TextStyle.lerp(
          forgotPasswordFormText, other.forgotPasswordFormText, t)!,
      forgotPasswordFormTitle: TextStyle.lerp(
          forgotPasswordFormTitle, other.forgotPasswordFormTitle, t)!,
      forgotPasswordFormTextBold: TextStyle.lerp(
          forgotPasswordFormTextBold, other.forgotPasswordFormTextBold, t)!,
      haveAnAccount: TextStyle.lerp(haveAnAccount, other.haveAnAccount, t)!,
      videoTitle: TextStyle.lerp(videoTitle, other.videoTitle, t)!,
      footerNavColumnTitle:
          TextStyle.lerp(footerNavColumnTitle, other.footerNavColumnTitle, t)!,
      footerNavColumnText:
          TextStyle.lerp(footerNavColumnText, other.footerNavColumnText, t)!,
      footerWeCareAboutYou:
          TextStyle.lerp(footerWeCareAboutYou, other.footerWeCareAboutYou, t)!,
      hoveredFooterNavColumnText: TextStyle.lerp(
          hoveredFooterNavColumnText, other.hoveredFooterNavColumnText, t)!,
    );
  }

  static get light => ThemeTextStyles(
        test: headline1.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w700,
        ),
        authButtonText: headline3.copyWith(
          color: AppColors.blue,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        loginFormText: headline3.copyWith(
          color: AppColors.white,
        ),
        loginFormTextBold: headline3.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        loginFormTitle: headline1.copyWith(
          color: AppColors.white,
        ),
        authFormHint: headline1.copyWith(fontSize: 14),
        authFormError: headline3.copyWith(
          color: AppColors.lighterPurple,
          fontWeight: FontWeight.w400,
        ),
        multiMetaUniverseTitle: headline1.copyWith(fontSize: 62),
        metaverseThatUnitesTitle: headline1.copyWith(fontSize: 52),
        fromFiftyDollarsTitle: headline1.copyWith(
          fontSize: 22,
          color: AppColors.purple,
        ),
        leadershipBonusesTitle: headline1.copyWith(
          fontSize: 22,
          color: AppColors.lightPurple,
        ),
        profitToPartnersTitle: headline1.copyWith(
          fontSize: 22,
          color: AppColors.lighterPurple,
        ),
        accountTitle: headline3.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.purple,
        ),
        homePagePurpleBodyText: headline3.copyWith(
          color: AppColors.purple,
          fontWeight: FontWeight.w500,
        ),
        revelantInfoTitle: headline2,
        purpleButtonText: headline3.copyWith(
          color: AppColors.white,
          fontSize: 14,
        ),
        registrationFormText: headline3.copyWith(
          color: AppColors.white,
        ),
        registrationFormTextBold: headline3.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        registrationFormTitle: headline1.copyWith(
          color: AppColors.white,
        ),
        forgotPasswordFormText: headline3.copyWith(
          color: AppColors.white,
        ),
        forgotPasswordFormTextBold: headline3.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        forgotPasswordFormTitle: headline1.copyWith(
          color: AppColors.white,
        ),
        haveAnAccount: headline3.copyWith(
          color: AppColors.white,
        ),
        videoTitle: headline1.copyWith(
          fontWeight: FontWeight.w400,
        ),
        footerNavColumnTitle: headline3.copyWith(
          color: AppColors.lightPurple,
          fontSize: 18,
          fontFamily:
              GoogleFonts.roboto(fontWeight: FontWeight.w300).fontFamily,
        ),
        footerNavColumnText: headline3.copyWith(
          color: AppColors.brighterWhite,
          fontSize: 16,
          fontFamily:
              GoogleFonts.roboto(fontWeight: FontWeight.w300).fontFamily,
        ),
        footerWeCareAboutYou: headline3.copyWith(
          color: AppColors.darkerGrey,
          fontSize: 12,
          fontFamily:
              GoogleFonts.roboto(fontWeight: FontWeight.w300).fontFamily,
        ),
        hoveredFooterNavColumnText: headline3.copyWith(
          color: AppColors.lightPurple,
          fontSize: 16,
          fontFamily:
              GoogleFonts.roboto(fontWeight: FontWeight.w300).fontFamily,
          decoration: TextDecoration.underline,
        ),
      );

  static get dark => ThemeTextStyles(
        test: headline1.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w700,
        ),
        authButtonText: headline3.copyWith(
          color: AppColors.blue,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        loginFormText: headline3.copyWith(
          color: AppColors.white,
        ),
        loginFormTextBold: headline3.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        loginFormTitle: headline1.copyWith(
          color: AppColors.white,
        ),
        authFormHint: headline1.copyWith(fontSize: 14),
        authFormError: headline3.copyWith(
          color: AppColors.lighterPurple,
          fontWeight: FontWeight.w400,
        ),
        multiMetaUniverseTitle: headline1.copyWith(fontSize: 62),
        metaverseThatUnitesTitle: headline1.copyWith(
          fontSize: 52,
        ),
        fromFiftyDollarsTitle: headline1.copyWith(
          fontSize: 22,
          color: AppColors.purple,
        ),
        leadershipBonusesTitle: headline1.copyWith(
          fontSize: 22,
          color: AppColors.lightPurple,
        ),
        profitToPartnersTitle: headline1.copyWith(
          fontSize: 22,
          color: AppColors.lighterPurple,
        ),
        accountTitle: headline3.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.purple,
        ),
        homePagePurpleBodyText: headline3.copyWith(
          color: AppColors.purple,
          fontWeight: FontWeight.w500,
        ),
        revelantInfoTitle: headline2,
        purpleButtonText: headline3.copyWith(
          color: AppColors.white,
          fontSize: 14,
        ),
        registrationFormText: headline3.copyWith(
          color: AppColors.white,
        ),
        registrationFormTextBold: headline3.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        registrationFormTitle: headline1.copyWith(
          color: AppColors.white,
        ),
        forgotPasswordFormText: headline3.copyWith(
          color: AppColors.white,
        ),
        forgotPasswordFormTextBold: headline3.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        forgotPasswordFormTitle: headline1.copyWith(
          color: AppColors.white,
        ),
        haveAnAccount: headline3.copyWith(
          color: AppColors.white,
        ),
        videoTitle: headline1.copyWith(
          fontWeight: FontWeight.w400,
        ),
        footerNavColumnTitle: headline3.copyWith(
          color: AppColors.lightPurple,
          fontSize: 18,
          fontFamily:
              GoogleFonts.roboto(fontWeight: FontWeight.w300).fontFamily,
        ),
        footerNavColumnText: headline3.copyWith(
          color: AppColors.brighterWhite,
          fontSize: 16,
          fontFamily:
              GoogleFonts.roboto(fontWeight: FontWeight.w300).fontFamily,
        ),
        footerWeCareAboutYou: headline3.copyWith(
          color: AppColors.grey,
          fontSize: 12,
          fontFamily:
              GoogleFonts.roboto(fontWeight: FontWeight.w300).fontFamily,
        ),
        hoveredFooterNavColumnText: headline3.copyWith(
          color: AppColors.lightPurple,
          fontSize: 16,
          fontFamily:
              GoogleFonts.roboto(fontWeight: FontWeight.w300).fontFamily,
          decoration: TextDecoration.underline,
        ),
      );
}
