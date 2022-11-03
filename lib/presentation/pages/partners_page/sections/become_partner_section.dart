part of "../partners_page.dart";

class _BecomePartnerSection extends StatelessWidget {
  const _BecomePartnerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      gradient: context.gradient.indigoTurquoiseDiagonal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(
          children: [
            Text(
              context.localizations.becomeAuroraPartner,
              style: context.text.becomePartnerSectionTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Text(
                context.localizations.joinAuroraTeam,
                style: context.text.becomePartnerSectionText,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 60),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 410),
              child: Wrap(
                spacing: 10,
                runSpacing: 20,
                children: [
                  _CareServiceButton(onTap: () {}),
                  _BecomePartnerButton(onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CareServiceButton extends StatelessWidget {
  final VoidCallback onTap;

  const _CareServiceButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hover(
      builder: (_) {
        return Container(
          height: 40,
          width: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: context.color.careServiceButton,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
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

class _BecomePartnerButton extends StatelessWidget {
  final VoidCallback onTap;

  const _BecomePartnerButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hover(
      builder: (_) {
        return Container(
          height: 40,
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: context.color.partnerButtonBorder),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          child: WebButton(
            onTap: onTap,
            child: Text(
              context.localizations.becomeAPartner,
              style: context.text.partnerButton,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
