part of '../blog_page.dart';

class _PresentationSection extends StatelessWidget {
  const _PresentationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: context.gradient.purpleLightShadowVertical,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1270),
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 100),
        child: Column(
          children: [
            Text(
              context.localizations.officeProgramMultiMetaUniverse,
              textAlign: TextAlign.center,
              style: context.text.blogPurpleSubHeadline,
            ),
            const SizedBox(height: 8),
            Text(
              context.localizations.multiMetaConsulting,
              textAlign: TextAlign.center,
              style: context.text.blogHeadline,
            ),
            const SizedBox(height: 8),
            Text(
              context.localizations.offlineDevelopment,
              textAlign: TextAlign.center,
              style: context.text.blogSubHeadline,
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
