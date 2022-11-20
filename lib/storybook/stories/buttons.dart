part of "../storybook_app.dart";

List<Story> get _buttons => [
      Story(
        name: "Buttons/AuthButton",
        wrapperBuilder: (context, child) =>
            CustomMaterialAppWrapper(child: child as Widget),
        builder: (context) => Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: 300,
              child: AuthButton(
                text: context.knobs.text(
                  label: "Text",
                  initial: "Login",
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
      Story(
        name: "Buttons/GradientButton",
        wrapperBuilder: (context, child) =>
            CustomMaterialAppWrapper(child: child as Widget),
        builder: (context) => Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: 300,
              child: GradientButton(
                title: context.knobs.text(
                  label: "Title",
                  initial: "Tap",
                ),
                onTap: () {},
                gradient: context.knobGradients,
              ),
            ),
          ),
        ),
      ),
      Story(
        name: "Buttons/MediaButtons",
        wrapperBuilder: (context, child) =>
            CustomMaterialAppWrapper(child: child as Widget),
        builder: (context) {
          return Scaffold(
            body: Container(
              alignment: Alignment.center,
              child: const SizedBox(
                width: 300,
                child: MediaButtons(),
              ),
            ),
          );
        },
      ),
    ];
