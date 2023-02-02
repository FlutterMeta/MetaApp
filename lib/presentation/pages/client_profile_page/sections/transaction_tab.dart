import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

class TransactionTab extends StatelessWidget {
  const TransactionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(gradient: context.gradient.lightIndigo),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 80 : 20,
          vertical: 20,
        ),
        constraints: BoxConstraints(minHeight: context.screenHeight - 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localizations.payment,
              style: context.text.clientPageBody
                  .copyWith(fontSize: 27, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            const _TransactionWindow(
              date: 'today, 13:02',
              lastRequestDateTime: '15:02:48 12-01-22',
              paymentSystem: 'Tether (ERC20)',
              price: '100.000000',
              requisites: '0x13e4b676e3794434a02810a009c97bd112d5e76c',
              status: 'Awaiting payment',
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionWindow extends StatelessWidget {
  final String status;
  final String lastRequestDateTime;
  final String price;
  final String requisites;
  final String date;
  final String paymentSystem;

  const _TransactionWindow({
    required this.price,
    required this.requisites,
    required this.status,
    required this.date,
    required this.paymentSystem,
    required this.lastRequestDateTime,
    Key? key,
  }) : super(key: key);

  static const _accountName = 'Bobr123';
  static const _accountEmail = 'adwdawdwa@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.clientPageBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: context.color.clientPagePrimary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          _RequestStatus(
            lastRequestDateTime: lastRequestDateTime,
            status: status,
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          const _GeneralInfo(
            accountEmail: _accountEmail,
            accountName: _accountName,
            price: '100.000000',
          ),
          const SizedBox(height: 20),
          const _WarningWindow(),
          const SizedBox(height: 40),
          _DetailsTable(
            date: date,
            paymentSystem: paymentSystem,
            price: price,
            requisites: requisites,
            status: status,
          ),
          const SizedBox(height: 20),
          Align(
            child: ColoredButton(
              title: context.localizations.cancel,
              color: context.color.clientPageError,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _RequestStatus extends StatelessWidget {
  final String status;
  final String lastRequestDateTime;

  const _RequestStatus({
    required this.status,
    required this.lastRequestDateTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Wrap(
        alignment: Responsive.isMobile(context)
            ? WrapAlignment.center
            : WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        runSpacing: 10,
        children: [
          Text(
            context.localizations.lastRequestDateTime,
            style: context.text.clientPageSubtitle.copyWith(fontSize: 16),
          ),
          Text(
            lastRequestDateTime,
            style: context.text.clientPageSubtitle
                .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: " ${context.localizations.requestStatus}: ",
                  style: context.text.clientPageSubtitle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: status,
                  style: context.text.clientPageSubtitle.copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GeneralInfo extends StatelessWidget {
  final String price;
  final String accountName;
  final String accountEmail;

  const _GeneralInfo({
    required this.price,
    required this.accountName,
    required this.accountEmail,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: Responsive.isMobile(context)
          ? WrapAlignment.center
          : WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 20,
      runSpacing: 10,
      children: [
        Wrap(
          spacing: 30,
          runSpacing: 20,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.localizations.contacts,
                  style: context.text.clientPageSubtitle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${context.localizations.telegramSupport}: @auroracare",
                  style: context.text.clientPageSubtitle.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  "${context.localizations.emailForQuestions}: care@aurora.com",
                  style: context.text.clientPageSubtitle.copyWith(fontSize: 16),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.localizations.clientAccount,
                  style: context.text.clientBotsDefault.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  accountName,
                  style: context.text.clientPageSubtitle
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  accountEmail,
                  style: context.text.clientPageSubtitle.copyWith(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            right:
                Responsive.isMobile(context) ? 0 : context.screenWidth * 0.06,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.auroraLogo,
                height: 68,
              ),
              Text(
                context.localizations.requestAmount,
                style: context.text.clientPageSubtitle
                    .copyWith(fontSize: 16, height: 1.3),
              ),
              Text(
                "$price USDT",
                style: context.text.clientPageSubtitle.copyWith(
                  fontSize: 16,
                  height: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: context.text.clientPageSubtitle
                      .copyWith(fontSize: 16, height: 1.3),
                  children: [
                    TextSpan(text: "${context.localizations.commision}: "),
                    TextSpan(
                      text: "0.5% \n${context.localizations.includedBill} ",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  style: context.text.clientPageSubtitle
                      .copyWith(fontSize: 16, height: 1.3),
                  children: [
                    TextSpan(text: "${context.localizations.tax}: "),
                    TextSpan(
                      text: "12.5% \n${context.localizations.includedBill} ",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WarningWindow extends StatelessWidget {
  const _WarningWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = context.localizations;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.color.warning.withOpacity(0.1),
      ),
      padding: const EdgeInsets.all(20),
      child: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              child: Icon(
                Icons.warning_rounded,
                color: context.color.warning,
              ),
            ),
            TextSpan(
              text: " ${localization.warning} ",
              style: context.text.warning
                  .copyWith(fontWeight: FontWeight.w800, fontSize: 15),
            ),
            TextSpan(
              text: localization.transactionWarningMessage,
              style: TextStyle(color: context.color.warning),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsTable extends StatelessWidget {
  final String status;
  final String date;
  final String paymentSystem;
  final String requisites;
  final String price;

  const _DetailsTable({
    required this.status,
    required this.date,
    required this.paymentSystem,
    required this.requisites,
    required this.price,
    Key? key,
  }) : super(key: key);

  Map<String, String> _details(BuildContext context) {
    return {
      context.localizations.status: status,
      context.localizations.date: date,
      context.localizations.paymentSystem: paymentSystem,
      context.localizations.requisites: requisites,
      context.localizations.price: price,
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          return _DetailsTableRow(
            index: index,
            label: _details(context).keys.elementAt(index),
            value: _details(context).values.elementAt(index),
          );
        },
        childCount: 5,
      ),
    );
  }
}

class _DetailsTableRow extends StatelessWidget {
  final String label;
  final String value;
  final int index;

  const _DetailsTableRow({
    required this.label,
    required this.value,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index % 2 == 0
          ? context.color.clientPagePrimary.withOpacity(0.1)
          : context.color.clientPageBackground,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
        spacing: 20,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SizedBox(
            width: Responsive.isMobile(context) ? 420 : 200,
            child: Text(
              label,
              textAlign: Responsive.isMobile(context)
                  ? TextAlign.center
                  : TextAlign.end,
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: 420,
            child: SelectableText(
              value,
              style: context.text.clientPageBody.copyWith(
                fontSize: 16,
                fontWeight: index == 0 ? FontWeight.bold : null,
              ),
              textAlign: Responsive.isMobile(context) ? TextAlign.center : null,
            ),
          ),
        ],
      ),
    );
  }
}
