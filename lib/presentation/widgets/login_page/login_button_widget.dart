import 'package:flutter/material.dart';
import 'package:meta_app/presentation/themes/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        child: Text(
          AppLocalizations.of(context)!.login,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
