part of '../header.dart';

class LocaleDropdownMenu extends StatefulWidget {
  const LocaleDropdownMenu({super.key});

  @override
  State<LocaleDropdownMenu> createState() => _LocaleDropdownMenuState();
}

class _LocaleDropdownMenuState extends State<LocaleDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAssets.engLocaleFlag, height: 20),
        const SizedBox(width: 10),
        const Icon(Icons.arrow_drop_down),
      ],
    );
  }
}
