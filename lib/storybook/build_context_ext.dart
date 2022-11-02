part of 'storybook_app.dart';

extension _BuildContextExt on BuildContext {
  Gradient get knobGradients => knobs.options<Gradient>(
        label: "Gradient",
        initial: gradient.indigoTurquoise,
        options: [
          Option(
            label: "Indigo Turquoise",
            value: gradient.indigoTurquoise,
          ),
          Option(
            label: "Light Indigo Turquoise",
            value: gradient.lightIndigoTurquoise,
          ),
          Option(
            label: "Indigo vertical",
            value: gradient.indigoVertical,
          ),
        ],
      );
}
