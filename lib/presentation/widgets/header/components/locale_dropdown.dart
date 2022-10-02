part of '../header.dart';

class _LocaleDropdown extends StatefulWidget {
  const _LocaleDropdown({Key? key}) : super(key: key);

  @override
  State<_LocaleDropdown> createState() => _LocaleDropdownState();
}

class _LocaleDropdownState extends State<_LocaleDropdown> {
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
