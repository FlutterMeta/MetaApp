part of '../theme.dart';

class ThemeGradients extends ThemeExtension<ThemeGradients> {
  final Gradient indigoTurquoise;
  final Gradient indigoTurquoiseReversed;
  final Gradient indigoTurquoiseDiagonal;
  final Gradient lightIndigoTurquoise;
  final Gradient lightIndigoTurquoiseVertical;
  final Gradient indigoVertical;
  final Gradient blackVertical;

  const ThemeGradients({
    required this.indigoTurquoise,
    required this.indigoTurquoiseReversed,
    required this.indigoTurquoiseDiagonal,
    required this.lightIndigoTurquoise,
    required this.indigoVertical,
    required this.blackVertical,
    required this.lightIndigoTurquoiseVertical,
  });

  @override
  ThemeExtension<ThemeGradients> copyWith({
    Gradient? indigoTurquoise,
    Gradient? indigoTurquoiseReversed,
    Gradient? indigoTurquoiseDiagonal,
    Gradient? lightIndigoTurquoise,
    Gradient? lightPurple,
    Gradient? indigoVertical,
    Gradient? blackVertical,
    Gradient? lightIndigoTurquoiseVertical,
  }) {
    return ThemeGradients(
      indigoTurquoise: indigoTurquoise ?? this.indigoTurquoise,
      indigoTurquoiseReversed:
          indigoTurquoiseReversed ?? this.indigoTurquoiseReversed,
      indigoVertical: indigoVertical ?? this.indigoVertical,
      blackVertical: blackVertical ?? this.blackVertical,
      indigoTurquoiseDiagonal:
          indigoTurquoiseDiagonal ?? this.indigoTurquoiseDiagonal,
      lightIndigoTurquoise: lightIndigoTurquoise ?? this.lightIndigoTurquoise,
      lightIndigoTurquoiseVertical:
          lightIndigoTurquoiseVertical ?? this.lightIndigoTurquoiseVertical,
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
      indigoTurquoise:
          Gradient.lerp(indigoTurquoise, other.indigoTurquoise, t)!,
      indigoTurquoiseReversed: Gradient.lerp(
        indigoTurquoiseReversed,
        other.indigoTurquoiseReversed,
        t,
      )!,
      indigoVertical: Gradient.lerp(indigoVertical, other.indigoVertical, t)!,
      blackVertical: Gradient.lerp(blackVertical, other.blackVertical, t)!,
      indigoTurquoiseDiagonal: Gradient.lerp(
          indigoTurquoiseDiagonal, other.indigoTurquoiseDiagonal, t)!,
      lightIndigoTurquoise:
          Gradient.lerp(lightIndigoTurquoise, other.lightIndigoTurquoise, t)!,
      lightIndigoTurquoiseVertical: Gradient.lerp(
        lightIndigoTurquoiseVertical,
        other.lightIndigoTurquoiseVertical,
        t,
      )!,
    );
  }

  static get light => ThemeGradients(
        indigoTurquoise: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.turquoise, AppColors.indigo],
        ),
        indigoTurquoiseReversed: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.indigo, AppColors.turquoise],
        ),
        indigoTurquoiseDiagonal: const LinearGradient(
          colors: [AppColors.indigo, AppColors.turquoise],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        lightIndigoTurquoise: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.lightIndigo.withOpacity(0.2),
            AppColors.turquoise.withOpacity(0.2)
          ],
        ),
        indigoVertical: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [AppColors.indigo, AppColors.indigo.withOpacity(0.2)],
        ),
        blackVertical: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.01, 1],
          colors: [AppColors.black.withOpacity(0.84), AppColors.transparent],
        ),
        lightIndigoTurquoiseVertical: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.lightIndigo.withOpacity(0.3),
            AppColors.turquoise.withOpacity(0.1)
          ],
        ),
      );

  static get dark => ThemeGradients(
        indigoTurquoise: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.turquoise, AppColors.indigo],
        ),
        indigoTurquoiseReversed: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.indigo, AppColors.turquoise],
        ),
        indigoTurquoiseDiagonal: const LinearGradient(
          colors: [AppColors.indigo, AppColors.turquoise],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        lightIndigoTurquoise: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.lightIndigo.withOpacity(0.2),
            AppColors.turquoise.withOpacity(0.2)
          ],
        ),
        indigoVertical: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [AppColors.indigo, AppColors.indigo.withOpacity(0.2)],
        ),
        blackVertical: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.01, 1],
          colors: [AppColors.black.withOpacity(0.84), AppColors.transparent],
        ),
        lightIndigoTurquoiseVertical: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.lightIndigo.withOpacity(0.2),
            AppColors.turquoise.withOpacity(0.1)
          ],
        ),
      );
}
