import 'package:flutter/material.dart';
import 'package:meta_app/presentation/themes/theme.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: Card(
                  child: Text(
                    "Button Pressed",
                  ),
                ),
              );
            },
          );
        },
        style: UISettings.buttonStyle,
        child: const Text(
          "Login",
          style: TextStyle(color: Colors.blue, fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
