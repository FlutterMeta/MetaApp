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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.localizations.payment),
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
        color: context.color.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: context.color.primary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _RequestStatus(
            lastRequestDateTime: lastRequestDateTime,
            status: status,
          ),
          const Divider(),
          const SizedBox(height: 20),
          const _GeneralInfo(
            accountEmail: _accountEmail,
            accountName: _accountName,
            price: '100.000000',
          ),
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
              color: context.color.error,
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
    return Wrap(
      alignment: Responsive.isMobile(context)
          ? WrapAlignment.center
          : WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        Text(context.localizations.lastRequestDateTime),
        Text(lastRequestDateTime),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(text: " ${context.localizations.requestStatus}: "),
              TextSpan(text: status),
            ],
          ),
        ),
      ],
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
      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.localizations.contacts),
            Text("${context.localizations.telegramSupport}: @auroracare"),
            Text("${context.localizations.emailForQuestions}: care@aurora.com"),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.localizations.clientAccount),
            Text(accountName),
            Text(accountEmail),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppAssets.auroraLogo,
              width: 100,
              height: 100,
            ),
            Text(context.localizations.requestAmount),
            Text("$price USDT"),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "${context.localizations.commision}: "),
                  TextSpan(
                    text: "0.5% \n${context.localizations.includedBill} ",
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ],
    );
  }
}
/* 
class _InfoElement extends StatelessWidget {
  const _InfoElement({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 160),
      child: Column(
        children: [

        ],
      ),
    );
  }
} */

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
          ? context.color.primary.withOpacity(0.1)
          : context.color.background,
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
              style: context.text.body.copyWith(
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
