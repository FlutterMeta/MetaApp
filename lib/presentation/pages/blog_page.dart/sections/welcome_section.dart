part of '../blog_page.dart';

class _WelcomeSection extends StatelessWidget {
  const _WelcomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      decoration: BoxDecoration(
        gradient: context.gradient.indigoTurquoise,
      ),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 670),
        child: Column(
          children: [
            Text(
              context.localizations.welcomeToTheAuroraUniverse,
              style: context.text.blogWelcomeHeadline,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Text(
                context.localizations.earnMoneyBuyingWMAShares,
                style: context.text.blogWelcomeDescription,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _AskButton(onTap: () {}),
                const SizedBox(width: 20),
                _BecomePartnerButton(onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AskButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AskButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hover(builder: (_) {
      return Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: context.color.askButtonBackground,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        child: WebButton(
          onTap: onTap,
          child: Text(
            context.localizations.askQuestion,
            style: context.text.askButton,
          ),
        ),
      );
    });
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: context.color.partnerButtonBorder),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
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
