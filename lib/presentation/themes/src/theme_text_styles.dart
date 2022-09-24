part of '../theme.dart';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  final TextStyle test;
  final TextStyle loginFormText;
  final TextStyle loginFormTitle;
  final TextStyle loginFormTextBold;
  final TextStyle loginButtonText;
  final TextStyle loginFormHint;
  final TextStyle loginFormError;
  final TextStyle largeTitle;
  final TextStyle gradientSubLargeTitle;
  final TextStyle purpleTitle;
  final TextStyle lightPurpleTitle;
  final TextStyle lighterPurpleTitle;
  final TextStyle purpleText;
  final TextStyle purpleBoldText;
  final TextStyle bodyText;
  final TextStyle bodyTextWhite;
  final TextStyle smallerBodyTextWhite;

  ThemeTextStyles({
    required this.test,
    required this.loginFormText,
    required this.loginFormTitle,
    required this.loginFormTextBold,
    required this.loginButtonText,
    required this.loginFormHint,
    required this.loginFormError,
    required this.largeTitle,
    required this.gradientSubLargeTitle,
    required this.purpleTitle,
    required this.lightPurpleTitle,
    required this.lighterPurpleTitle,
    required this.purpleText,
    required this.purpleBoldText,
    required this.bodyText,
    required this.bodyTextWhite,
    required this.smallerBodyTextWhite,
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
    TextStyle? largeTitle,
    TextStyle? gradientSubLargeTitle,
    TextStyle? purpleTitle,
    TextStyle? lightPurpleTitle,
    TextStyle? lighterPurpleTitle,
    TextStyle? purpleBoldText,
    TextStyle? purpleText,
    TextStyle? bodyText,
    TextStyle? bodyTextWhite,
    TextStyle? smallerBodyTextWhite,
  }) {
    return ThemeTextStyles(
      test: test ?? this.test,
      loginFormText: loginFormText ?? this.loginFormText,
      loginFormTitle: loginFormTitle ?? this.loginFormTitle,
      loginFormTextBold: loginFormTextBold ?? this.loginFormTextBold,
      loginButtonText: loginButtonText ?? this.loginButtonText,
      loginFormHint: loginFormHint ?? this.loginFormHint,
      loginFormError: loginFormError ?? this.loginFormError,
      largeTitle: largeTitle ?? this.largeTitle,
      gradientSubLargeTitle:
          gradientSubLargeTitle ?? this.gradientSubLargeTitle,
      purpleTitle: purpleTitle ?? this.purpleTitle,
      lightPurpleTitle: lightPurpleTitle ?? this.lightPurpleTitle,
      lighterPurpleTitle: lighterPurpleTitle ?? this.lighterPurpleTitle,
      purpleBoldText: purpleBoldText ?? this.purpleBoldText,
      purpleText: purpleText ?? this.purpleText,
      bodyText: bodyText ?? this.bodyText,
      bodyTextWhite: bodyTextWhite ?? this.bodyTextWhite,
      smallerBodyTextWhite: smallerBodyTextWhite ?? this.smallerBodyTextWhite,
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
      largeTitle: TextStyle.lerp(largeTitle, other.largeTitle, t)!,
      purpleTitle: TextStyle.lerp(purpleTitle, other.purpleTitle, t)!,
      lightPurpleTitle:
          TextStyle.lerp(lightPurpleTitle, other.lightPurpleTitle, t)!,
      lighterPurpleTitle:
          TextStyle.lerp(lighterPurpleTitle, other.lighterPurpleTitle, t)!,
      gradientSubLargeTitle: TextStyle.lerp(
          gradientSubLargeTitle, other.gradientSubLargeTitle, t)!,
      purpleBoldText: TextStyle.lerp(purpleBoldText, other.purpleBoldText, t)!,
      purpleText: TextStyle.lerp(purpleText, other.purpleText, t)!,
      bodyText: TextStyle.lerp(bodyText, other.bodyText, t)!,
      bodyTextWhite: TextStyle.lerp(bodyTextWhite, other.bodyTextWhite, t)!,
      smallerBodyTextWhite:
          TextStyle.lerp(smallerBodyTextWhite, other.smallerBodyTextWhite, t)!,
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
        largeTitle: headline1.copyWith(fontSize: 62),
        gradientSubLargeTitle: headline1.copyWith(
          fontSize: 52,
        ),
        purpleTitle: headline1.copyWith(fontSize: 22, color: AppColors.purple),
        lightPurpleTitle:
            headline1.copyWith(fontSize: 22, color: AppColors.lightPurple),
        lighterPurpleTitle:
            headline1.copyWith(fontSize: 22, color: AppColors.lighterPurple),
        purpleBoldText: headline3.copyWith(
            fontWeight: FontWeight.bold, color: AppColors.purple),
        purpleText: headline3.copyWith(
            color: AppColors.purple, fontWeight: FontWeight.w500),
        bodyText: headline2,
        bodyTextWhite: headline3.copyWith(color: AppColors.white),
        smallerBodyTextWhite:
            headline3.copyWith(color: AppColors.white, fontSize: 14),
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
        largeTitle: headline1.copyWith(fontSize: 62),
        gradientSubLargeTitle: headline1.copyWith(
          fontSize: 52,
        ),
        purpleTitle: headline1.copyWith(fontSize: 22, color: AppColors.purple),
        lightPurpleTitle:
            headline1.copyWith(fontSize: 22, color: AppColors.lightPurple),
        lighterPurpleTitle:
            headline1.copyWith(fontSize: 22, color: AppColors.lighterPurple),
        purpleBoldText: headline3.copyWith(
            fontWeight: FontWeight.bold, color: AppColors.purple),
        purpleText: headline3.copyWith(color: AppColors.purple),
        bodyText: headline2,
        bodyTextWhite: headline3.copyWith(color: AppColors.white),
        smallerBodyTextWhite:
            headline3.copyWith(color: AppColors.white, fontSize: 14),
      );
}
