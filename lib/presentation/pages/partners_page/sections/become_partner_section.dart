part of "../partners_page.dart";

class _BecomePartnerSection extends StatelessWidget {
  const _BecomePartnerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      gradient: context.gradient.deepPurple,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(
          children: [
            Text(
              context.localizations.becomeAMultiMetaPartner,
              style: context.text.becomePartnerSectionTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              context.localizations.joinMultiMetaTeam,
              style: context.text.becomePartnerSectionText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                _CareSericeButton(onTap: () {}),
                _CareSericeButton(onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CareSericeButton extends StatelessWidget {
  final VoidCallback onTap;

  const _CareSericeButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hover(
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: context.color.joinButtonBorder),
            color: context.color.careSeviceButton,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          clipBehavior: Clip.antiAlias,
          child: WebButton(
            onTap: onTap,
            child: Text(
              context.localizations.customerCareService,
              textAlign: TextAlign.center,
              style: context.text.careServiceButton,
            ),
          ),
        );
      },
    );
  }
}
