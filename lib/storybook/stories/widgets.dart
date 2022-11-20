part of "../storybook_app.dart";

List<Story> get _widgets => [
      Story(
        name: 'Widgets/SliverSizedBox',
        wrapperBuilder: (context, child) =>
            CustomMaterialAppWrapper(child: child as Widget),
        builder: (context) => Scaffold(
          body: CustomScrollView(
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
      ),
      Story(
        name: "Widgets/GradientBackground",
        wrapperBuilder: (context, child) =>
            CustomMaterialAppWrapper(child: child as Widget),
        builder: (context) => Scaffold(
          body: GradientBackground(
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
      ),
      Story(
        name: "Widgets/GradientText",
        wrapperBuilder: (context, child) =>
            CustomMaterialAppWrapper(child: child as Widget),
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
