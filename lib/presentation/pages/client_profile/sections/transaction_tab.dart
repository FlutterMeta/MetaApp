import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

import '../../../../data/models/payment_system.dart';
import '../../../../data/models/product.dart';
import '../../../../data/models/user.dart';
import '../../../redux/app_state.dart';

class TransactionTab extends StatefulWidget {
  final Product product;
  final PaymentSystem paymentSystem;

  const TransactionTab({
    required this.product,
    required this.paymentSystem,
    Key? key,
  }) : super(key: key);

  @override
  _TransactionTabState createState() => _TransactionTabState();
}

class _TransactionTabState extends State<TransactionTab> {
  bool _paymentDone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localizations.payment,
            style: context.text.profilePageBody
                .copyWith(fontSize: 27, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          if (_paymentDone)
            _PaymentSuccessMessage()
          else
            _TransactionWindow(
              product: widget.product,
              paymentSystem: widget.paymentSystem,
              onPaymentDone: () => setState(() => _paymentDone = true),
            ),
        ],
      ),
    );
  }
}

class _PaymentSuccessMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.greenCheck,
          height: Responsive.isMobile(context) ? 100 : 160,
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${context.localizations.thanksForPayment}!",
                    style: context.text.profilePageBody.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: context.localizations.afterPaymentTip,
                    style: context.text.profilePageBody.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // RichText(
            //   text: TextSpan(
            //     children: [
            //       TextSpan(
            //         text: context.localizations.keyTip,
            //         style: context.text.profilePageBody.copyWith(
            //           fontSize: 18,
            //           fontWeight: FontWeight.w700,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: context.color.okay.withOpacity(0.1),
              ),
              padding: const EdgeInsets.all(20),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.warning_rounded,
                        color: context.color.okay,
                      ),
                    ),
                    TextSpan(
                      text: context.localizations.keyTip,
                      style: TextStyle(
                        color: context.color.okay,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 100),
        ColoredButton(
          title: context.localizations.ok.toUpperCase(),
          color: Colors.green,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class _TransactionWindow extends StatelessWidget {
  final Product product;
  final PaymentSystem paymentSystem;
  final VoidCallback onPaymentDone;

  const _TransactionWindow({
    required this.product,
    required this.paymentSystem,
    required this.onPaymentDone,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, User?>(
      converter: (store) => store.state.currentUser,
      builder: (context, currentUser) {
        return Container(
          decoration: BoxDecoration(
            color: context.color.profilePageBackground,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: context.color.profilePagePrimary.withOpacity(0.1),
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
              const Divider(),
              const SizedBox(height: 20),
              _GeneralInfo(
                accountEmail: currentUser?.email ?? '',
                accountName: currentUser?.login ?? '',
                price: product.price.toString(),
              ),
              const SizedBox(height: 20),
              const _WarningWindow(),
              const SizedBox(height: 40),
              _DetailsTable(
                date: DateTime.now().toString(),
                paymentSystem: paymentSystem.title,
                price: product.price.toString(),
                requisites: paymentSystem.key,
                status: 'Pending',
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    child: ColoredButton(
                      title: context.localizations.paid,
                      color: context.color.profilePagePrimary,
                      onTap: onPaymentDone,
                    ),
                  ),
                  Align(
                    child: ColoredButton(
                      title: context.localizations.cancel,
                      color: context.color.profilePageError,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
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
            style: context.text.profilePageSubtitle.copyWith(fontSize: 16),
          ),
          Text(
            lastRequestDateTime,
            style: context.text.profilePageSubtitle
                .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: " ${context.localizations.requestStatus}: ",
                  style: context.text.profilePageSubtitle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: status,
                  style:
                      context.text.profilePageSubtitle.copyWith(fontSize: 16),
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
                  style: context.text.profilePageSubtitle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${context.localizations.telegramSupport}: @auroracare",
                  style:
                      context.text.profilePageSubtitle.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  "${context.localizations.emailForQuestions}: care@aurora.com",
                  style:
                      context.text.profilePageSubtitle.copyWith(fontSize: 16),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.localizations.clientAccount,
                  style: context.text.profileBotsDefault.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  accountName,
                  style: context.text.profilePageSubtitle
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  accountEmail,
                  style:
                      context.text.profilePageSubtitle.copyWith(fontSize: 16),
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
                style: context.text.profilePageSubtitle
                    .copyWith(fontSize: 16, height: 1.3),
              ),
              Text(
                "$price USD",
                style: context.text.profilePageSubtitle.copyWith(
                  fontSize: 16,
                  height: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: context.text.profilePageSubtitle
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
                  style: context.text.profilePageSubtitle
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
          ? context.color.profilePagePrimary.withOpacity(0.1)
          : context.color.profilePageBackground,
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
              style: context.text.profilePageBody.copyWith(
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
