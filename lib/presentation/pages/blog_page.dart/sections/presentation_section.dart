part of '../blog_page.dart';

class _PresentationSection extends StatelessWidget {
  const _PresentationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.indigoBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            context.localizations.officeProgramAuroraUniverse,
            style: context.text.blogSubHeadline,
          ),
          const SizedBox(height: 20),
          Text(
            context.localizations.auroraConsulting,
            style: context.text.blogHeadline,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
