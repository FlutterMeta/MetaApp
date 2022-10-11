part of "../storybook_app.dart";

List<Story> get _buttons => [
      Story(
        name: "Buttons/AuthButton",
        builder: (context) => Container(
          color: Colors.black,
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
      Story(
        name: "Buttons/GradientButton",
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
