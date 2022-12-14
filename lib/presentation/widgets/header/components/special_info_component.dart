part of '../header.dart';

class _SpecialInfoComponent extends StatelessWidget {
  const _SpecialInfoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebButton(
      borderRadius: BorderRadius.circular(8),
      hoverColor: context.color.infoCardBackground,
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(context.localizations.moreFactsAbout),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.color.roadmapCardBackground,
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                context.localizations.roadmap,
                style: context.text.purpleButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
