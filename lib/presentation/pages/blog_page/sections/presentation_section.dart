part of '../blog_page.dart';

class _PresentationSection extends StatelessWidget {
  const _PresentationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1270),
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
        ],
      ),
    );
  }
}
