part of '../theme.dart';

class ThemeGradients extends ThemeExtension<ThemeGradients> {
  final Gradient purple;
  final Gradient lightPurple;
  final Gradient purpleVertical;
  final Gradient deepPurple;
  final Gradient shadowVertical;
  final Gradient purpleLightShadowVertical;

  const ThemeGradients({
    required this.purple,
    required this.purpleVertical,
    required this.lightPurple,
    required this.deepPurple,
    required this.shadowVertical,
    required this.purpleLightShadowVertical,
  });

  @override
  ThemeExtension<ThemeGradients> copyWith({
    Gradient? purple,
    Gradient? lightPurple,
    Gradient? purpleVertical,
    Gradient? deepPurple,
    Gradient? shadowVertical,
    Gradient? purpleLightShadowVertical,
  }) {
    return ThemeGradients(
      purple: purple ?? this.purple,
      lightPurple: lightPurple ?? this.lightPurple,
      purpleVertical: purpleVertical ?? this.purpleVertical,
      deepPurple: deepPurple ?? this.deepPurple,
      shadowVertical: shadowVertical ?? this.shadowVertical,
      purpleLightShadowVertical:
          purpleLightShadowVertical ?? this.purpleLightShadowVertical,
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
      shadowVertical: Gradient.lerp(shadowVertical, other.shadowVertical, t)!,
      purpleLightShadowVertical: Gradient.lerp(
          purpleLightShadowVertical, other.purpleLightShadowVertical, t)!,
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
        shadowVertical: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.01, 1],
          colors: [AppColors.black.withOpacity(0.84), AppColors.transparent],
        ),
        purpleLightShadowVertical: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.01, 0.05, 0.15, 0.3, 0.5],
          colors: [
            AppColors.purple.withOpacity(0.4),
            AppColors.purple.withOpacity(0.3),
            AppColors.purple.withOpacity(0.2),
            AppColors.purple.withOpacity(0.1),
            AppColors.transparent,
          ],
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
        shadowVertical: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.4, 0.5],
          colors: [AppColors.purple, AppColors.lightPurple],
        ),
        purpleLightShadowVertical: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.01, 0.1],
          colors: [AppColors.black.withOpacity(0.64), AppColors.transparent],
        ),
      );
}
