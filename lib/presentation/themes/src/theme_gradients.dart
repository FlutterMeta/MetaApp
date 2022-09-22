part of '../theme.dart';

class ThemeGradients extends ThemeExtension<ThemeGradients> {
  final LinearGradient purple;
  final LinearGradient lightPurple;

  const ThemeGradients({
    required this.purple,
    required this.lightPurple,
  });

  @override
  ThemeExtension<ThemeGradients> copyWith({
    LinearGradient? purple,
    LinearGradient? lightPurple,
  }) {
    return ThemeGradients(
      purple: purple ?? this.purple,
      lightPurple: lightPurple ?? this.lightPurple,
    );
  }

  @override
  ThemeExtension<ThemeGradients> lerp(
    ThemeExtension<ThemeGradients>? other,
    double t,
  ) {
    if (other is! ThemeGradients) {
      return this;
    }

    return ThemeGradients(
      purple: LinearGradient.lerp(purple, other.purple, t)!,
      lightPurple: LinearGradient.lerp(lightPurple, other.lightPurple, t)!,
    );
  }

  static get light => const ThemeGradients(
        lightPurple: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.01, 0.99],
          colors: [AppColors.lighterPurple, AppColors.white],
        ),
        purple: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.4, 0.8],
          colors: [AppColors.purple, AppColors.lightPurple],
        ),
      );
  static get dark => const ThemeGradients(
        lightPurple: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.01, 0.99],
          colors: [AppColors.lighterPurple, AppColors.white],
        ),
        purple: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.4, 0.8],
          colors: [AppColors.purple, AppColors.lightPurple],
        ),
      );
}
