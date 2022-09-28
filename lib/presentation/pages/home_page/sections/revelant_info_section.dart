part of '../home_page.dart';

class _RevelantInfoSection extends StatelessWidget {
  const _RevelantInfoSection({
    Key? key,
  }) : super(key: key);

  static final info = [
    "MultiMeta Universe video presentation",
    "Profitability Programs",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: context.screenWidth < 780
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: info
          .map((info) => _InfoCard(
                title: info,
                onTap: () {},
              ))
          .toList(),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _InfoCard({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      constraints: BoxConstraints(
        maxWidth: context.screenWidth * 0.28,
      ),
      child: Hover(builder: (_) {
        return WebButton(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: context.color.infoCardBackground,
              child: Text(title, style: context.text.homePagePurpleBodyText),
            ),
          ),
        );
      }),
    );
  }
}
