part of '../theme.dart';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  final TextStyle test;
  final TextStyle loginFormText;
  final TextStyle loginFormTitle;
  final TextStyle loginFormTextBold;
  final TextStyle loginButtonText;
  final TextStyle loginFormHint;
  final TextStyle loginFormError;
  final TextStyle multiMetaUniverseTitle;
  final TextStyle metaverseThatUnitesTitle;
  final TextStyle fromFiftyDollarsTitle;
  final TextStyle leadershipBonusesTitle;
  final TextStyle profitToPartnersTitle;
  final TextStyle homePagePurpleBodyText;
  final TextStyle accountTitle;
  final TextStyle revelantInfoTitle;

  final TextStyle darkBackgroundText;

  ThemeTextStyles({
    required this.test,
    required this.loginFormText,
    required this.loginFormTitle,
    required this.loginFormTextBold,
    required this.loginButtonText,
    required this.loginFormHint,
    required this.loginFormError,
    required this.multiMetaUniverseTitle,
    required this.metaverseThatUnitesTitle,
    required this.fromFiftyDollarsTitle,
    required this.leadershipBonusesTitle,
    required this.profitToPartnersTitle,
    required this.homePagePurpleBodyText,
    required this.accountTitle,
    required this.revelantInfoTitle,
    required this.darkBackgroundText,
  });

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    TextStyle? test,
    TextStyle? loginFormText,
    TextStyle? loginFormTitle,
    TextStyle? loginFormTextBold,
    TextStyle? loginButtonText,
    TextStyle? loginFormHint,
    TextStyle? loginFormError,
    TextStyle? multiMetaUniverseTitle,
    TextStyle? metaverseThatUnitesTitle,
    TextStyle? fromFiftyDollarsTitle,
    TextStyle? leadershipBonusesTitle,
    TextStyle? profitToPartnersTitle,
    TextStyle? accountTitle,
    TextStyle? homePagePurpleBodyText,
    TextStyle? revelantInfoTitle,
    TextStyle? darkBackgroundText,
  }) {
    return ThemeTextStyles(
      test: test ?? this.test,
      loginFormText: loginFormText ?? this.loginFormText,
      loginFormTitle: loginFormTitle ?? this.loginFormTitle,
      loginFormTextBold: loginFormTextBold ?? this.loginFormTextBold,
      loginButtonText: loginButtonText ?? this.loginButtonText,
      loginFormHint: loginFormHint ?? this.loginFormHint,
      loginFormError: loginFormError ?? this.loginFormError,
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
      darkBackgroundText: darkBackgroundText ?? this.darkBackgroundText,
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
      loginButtonText:
          TextStyle.lerp(loginButtonText, other.loginButtonText, t)!,
      loginFormHint: TextStyle.lerp(loginFormHint, other.loginFormHint, t)!,
      loginFormError: TextStyle.lerp(loginFormError, other.loginFormError, t)!,
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
      darkBackgroundText:
          TextStyle.lerp(darkBackgroundText, other.darkBackgroundText, t)!,
    );
  }

  static get light => ThemeTextStyles(
        test: headline1.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w700,
        ),
        loginButtonText: headline3.copyWith(
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
        loginFormHint: headline1.copyWith(fontSize: 14),
        loginFormError: headline3.copyWith(
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
        darkBackgroundText: headline3.copyWith(
          color: AppColors.white,
          fontSize: 14,
        ),
      );

  static get dark => ThemeTextStyles(
        test: headline1.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w700,
        ),
        loginButtonText: headline3.copyWith(
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
        loginFormHint: headline1.copyWith(fontSize: 14),
        loginFormError: headline3.copyWith(
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
        darkBackgroundText: headline3.copyWith(
          color: AppColors.white,
          fontSize: 14,
        ),
      );
}
