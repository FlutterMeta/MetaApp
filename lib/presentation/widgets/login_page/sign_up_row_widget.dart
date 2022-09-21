import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpRowWidget extends StatelessWidget {
  const SignUpRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.dontHaveAnAccount,
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
          child: Text(
            AppLocalizations.of(context)!.signUp,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ],
    );
  }
}
