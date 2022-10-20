part of '../theme.dart';

class ThemeGradients extends ThemeExtension<ThemeGradients> {
  final Gradient purple;
  final Gradient lightPurple;
  final Gradient purpleVertical;
  final Gradient deepPurple;

  const ThemeGradients({
    required this.purple,
    required this.purpleVertical,
    required this.lightPurple,
    required this.deepPurple,
  });

  @override
  ThemeExtension<ThemeGradients> copyWith({
    Gradient? purple,
    Gradient? lightPurple,
    Gradient? purpleVertical,
    Gradient? deepPurple,
  }) {
    return ThemeGradients(
      purple: purple ?? this.purple,
      lightPurple: lightPurple ?? this.lightPurple,
      purpleVertical: purpleVertical ?? this.purpleVertical,
      deepPurple: deepPurple ?? this.deepPurple,
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
      purple: Gradient.lerp(purple, other.purple, t)!,
      lightPurple: Gradient.lerp(lightPurple, other.lightPurple, t)!,
      purpleVertical: Gradient.lerp(purpleVertical, other.purpleVertical, t)!,
      deepPurple: Gradient.lerp(deepPurple, other.deepPurple, t)!,
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
        purpleVertical: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.4, 0.5],
          colors: [AppColors.purple, AppColors.lightPurple],
        ),
        deepPurple: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.99, 0.01],
          colors: [AppColors.darkPurple, AppColors.purple],
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
        purpleVertical: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.4, 0.5],
          colors: [AppColors.purple, AppColors.white],
        ),
        deepPurple: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.99, 0.01],
          colors: [AppColors.purple, AppColors.darkPurple],
        ),
      );
}
