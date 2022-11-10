part of '../directions_page.dart';

class _ProfitSection extends StatelessWidget {
  const _ProfitSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 116),
      decoration: BoxDecoration(
        gradient: context.gradient.indigoTurquoiseDiagonal,
      ),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 670),
        child: Column(
          children: [
            Text(
              context.localizations.profitWithAurora,
              style: context.text.blogWelcomeHeadline,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: Text(
                context.localizations.getIncomeFromPersonal,
                style: context.text.blogWelcomeDescription,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _TermsButton(onTap: () {}),
                const SizedBox(width: 20),
                _JoinButton(onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TermsButton extends StatelessWidget {
  final VoidCallback onTap;

  const _TermsButton({
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
            color: context.color.askButtonBackground,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          child: WebButton(
            onTap: onTap,
            child: Text(
              context.localizations.terms,
              style: context.text.askButton,
            ),
          ),
        );
      },
    );
  }
}

class _JoinButton extends StatelessWidget {
  final VoidCallback onTap;

  const _JoinButton({
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          child: WebButton(
            onTap: onTap,
            child: Text(
              context.localizations.join,
              style: context.text.partnerButton,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
