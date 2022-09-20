import 'package:flutter/material.dart';

class SignUpRowWidget extends StatelessWidget {
  const SignUpRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Don't have an account yet?",
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: (() {
            showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: Card(
                    child: Text("Sign Up Button Pressed"),
                  ),
                );
              },
            );
          }),
          child:  Text(
            "Sign Up",
          style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ],
    );
  }
}
