part of '../home_page.dart';

class _RevenueSection extends StatelessWidget {
  const _RevenueSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1270),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.localizations.revenueMarketing,
                style: context.text.revenueSectionTitle,
              ),
              const SizedBox(height: 28),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 560,
                    child: _NewsSection(
                      title: context.localizations.followAuroraNews,
                      onTap: () {},
                      news: [
                        _News(
                          date: DateTime(2022, 5, 28),
                          text: context.localizations.bringingInterest,
                        ),
                        _News(
                          date: DateTime(2022, 8, 28),
                          text: context.localizations.firstOfTwelfInterest,
                        ),
                      ],
                    ),
                  ),
                  const _RateCard(),
                  SizedBox(
                    width: 280,
                    child: _NewsSection(
                      title: context.localizations.latestNewsInTelegram,
                      onTap: () {},
                      news: [
                        _News(
                          date: DateTime(2025, 5, 28),
                          text: context.localizations.expirationOfAdvertising,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewsSection extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final List<_News> news;

  const _NewsSection({
    required this.title,
    required this.onTap,
    required this.news,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: context.text.revenueSectionNewsTitle,
                ),
                const SizedBox(width: 14),
                Icon(
                  Icons.arrow_forward,
                  color: context.color.revenueSectionArrowIcon,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 18),
        Divider(
          height: 1,
          color: context.color.revenueSectionDivider,
        ),
        const SizedBox(height: 22),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: news.map((item) => _NewsCard(news: item)).toList(),
        ),
      ],
    );
  }
}

class _NewsCard extends StatelessWidget {
  final _News news;

  const _NewsCard({
    required this.news,
    Key? key,
  }) : super(key: key);

  //TODO: check date is translated after changing locale
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            news.date.formatted,
            style: context.text.revenueSectionNewsCardTitle,
          ),
          const SizedBox(height: 20),
          Text(
            news.text,
            style: context.text.revenueSectionNewsCardText,
          ),
        ],
      ),
    );
  }
}

class _RateCard extends StatelessWidget {
  const _RateCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.color.revenueSectionRateCardBorder),
      ),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(40),
      child: RichText(
        text: TextSpan(
          style: context.text.revenueSectionRateCard,
          children: [
            TextSpan(text: context.localizations.checkOutInterest),
            TextSpan(
              text: context.localizations.yieldRateTable,
              style: context.text.revenueSectionRateCardHighlighted,
            ),
          ],
        ),
      ),
    );
  }
}

class _News {
  final DateTime date;
  final String text;

  _News({
    required this.date,
    required this.text,
  });
}
