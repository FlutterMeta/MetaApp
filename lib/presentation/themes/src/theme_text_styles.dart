part of '../theme.dart';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  final TextStyle test;
  final TextStyle loginFormText;
  final TextStyle loginFormTitle;
  final TextStyle loginFormTextBold;
  final TextStyle loginButtonText;
  final TextStyle loginFormHint;
  final TextStyle loginFormError;

  ThemeTextStyles({
    required this.test,
    required this.loginFormText,
    required this.loginFormTitle,
    required this.loginFormTextBold,
    required this.loginButtonText,
    required this.loginFormHint,
    required this.loginFormError,
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
  }) {
    return ThemeTextStyles(
      test: test ?? this.test,
      loginFormText: loginFormText ?? this.loginFormText,
      loginFormTitle: loginFormTitle ?? this.loginFormTitle,
      loginFormTextBold: loginFormTextBold ?? this.loginFormTextBold,
      loginButtonText: loginButtonText ?? this.loginButtonText,
      loginFormHint: loginFormHint ?? this.loginFormHint,
      loginFormError: loginFormError ?? this.loginFormError,
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
      );
}
