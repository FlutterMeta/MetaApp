import 'package:flutter/material.dart';
import 'package:meta_app/presentation/themes/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordRowWidget extends StatelessWidget {
  const ForgotPasswordRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.forgotPassword,
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
                    child: Text("Restore Button Pressed"),
                  ),
                );
              },
            );
          }),
          child: Text(
            AppLocalizations.of(context)!.restore,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
