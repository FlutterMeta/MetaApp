part of "../storybook_app.dart";

List<Story> get _widgets => [
      Story(
        name: 'Widgets/SliverSizedBox',
        builder: (context) => CustomScrollView(
          slivers: [
            SliverSizedBox(
              height: context.knobs.slider(
                label: "Height",
                min: 100,
                max: 500,
                initial: 100,
              ),
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      Story(
        name: "Widgets/GradientBackground",
        builder: (context) => GradientBackground(
          gradient: context.knobGradients,
          child: Center(
            child: Container(
              height: 333,
              width: 333,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      Story(
        name: "Widgets/GradientText",
        builder: (context) => Scaffold(
          body: Center(
            child: GradientText(
              text: context.knobs.text(label: "Text", initial: "Gradient text"),
              gradient: context.knobGradients,
            ),
          ),
        ),
      ),
    ];
