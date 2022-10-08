part of 'storybook_app.dart';

extension _BuildContextExt on BuildContext {
  Gradient get knobGradients => knobs.options<Gradient>(
        label: "Gradient",
        initial: gradient.purple,
        options: [
          Option(
            label: "Purple",
            value: gradient.purple,
          ),
          Option(
            label: "Light purple",
            value: gradient.lightPurple,
          ),
          Option(
            label: "Purple vertical",
            value: gradient.purpleVertical,
          ),
        ],
      );
}
