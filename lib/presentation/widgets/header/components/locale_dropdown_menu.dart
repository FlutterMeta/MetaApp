part of '../header.dart';

class _LocaleDropdownMenu extends StatefulWidget {
  const _LocaleDropdownMenu({Key? key}) : super(key: key);

  @override
  State<_LocaleDropdownMenu> createState() => _LocaleDropdownMenuState();
}

class _LocaleDropdownMenuState extends State<_LocaleDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAssets.engFlag, height: 20),
        const SizedBox(width: 10),
        const Icon(Icons.arrow_drop_down),
      ],
    );
  }
}
