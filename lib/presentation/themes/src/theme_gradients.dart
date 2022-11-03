part of '../theme.dart';

class ThemeGradients extends ThemeExtension<ThemeGradients> {
  final Gradient purple;
  final Gradient lightPurple;
  final Gradient purpleVertical;
  final Gradient deepPurple;
  final Gradient blackVertical;
  final Gradient indigoTurquoise;

  const ThemeGradients({
    required this.purple,
    required this.purpleVertical,
    required this.lightPurple,
    required this.deepPurple,
    required this.blackVertical,
    required this.indigoTurquoise,
  });

  @override
  ThemeExtension<ThemeGradients> copyWith({
    Gradient? purple,
    Gradient? lightPurple,
    Gradient? purpleVertical,
    Gradient? deepPurple,
    Gradient? blackVertical,
    Gradient? indigoTurquoise,
  }) {
    return ThemeGradients(
      purple: purple ?? this.purple,
      lightPurple: lightPurple ?? this.lightPurple,
      purpleVertical: purpleVertical ?? this.purpleVertical,
      deepPurple: deepPurple ?? this.deepPurple,
      blackVertical: blackVertical ?? this.blackVertical,
      indigoTurquoise: indigoTurquoise ?? this.indigoTurquoise,
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
      blackVertical: Gradient.lerp(blackVertical, other.blackVertical, t)!,
      indigoTurquoise:
          Gradient.lerp(indigoTurquoise, other.indigoTurquoise, t)!,
    );
  }

  static get light => ThemeGradients(
        lightPurple: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.01, 0.99],
          colors: [AppColors.lighterPurple, AppColors.white],
        ),
        purple: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.4, 0.8],
          colors: [AppColors.purple, AppColors.lightPurple],
        ),
        purpleVertical: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.4, 0.5],
          colors: [AppColors.purple, AppColors.lightPurple],
        ),
        deepPurple: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.99, 0.01],
          colors: [AppColors.darkPurple, AppColors.purple],
        ),
        blackVertical: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.01, 1],
          colors: [AppColors.black.withOpacity(0.84), AppColors.transparent],
        ),
        indigoTurquoise: const LinearGradient(
          colors: [AppColors.indigo, AppColors.turquoise],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      );

  static get dark => ThemeGradients(
        lightPurple: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.01, 0.99],
          colors: [AppColors.lighterPurple, AppColors.white],
        ),
        purple: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.4, 0.8],
          colors: [AppColors.purple, AppColors.lightPurple],
        ),
        purpleVertical: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.4, 0.5],
          colors: [AppColors.purple, AppColors.white],
        ),
        deepPurple: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.99, 0.01],
          colors: [AppColors.purple, AppColors.darkPurple],
        ),
        blackVertical: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.01, 1],
          colors: [AppColors.black.withOpacity(0.84), AppColors.transparent],
        ),
        indigoTurquoise: const LinearGradient(
          colors: [AppColors.indigo, AppColors.turquoise],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      );
}
