import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta_app/core/global.dart';
import 'package:meta_app/core/mixins/message_overlay.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'dart:html' as html;

import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:meta_app/presentation/widgets/message_chip.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';
import 'package:meta_app/presentation/widgets/temporarily_disabled_colored_button.dart';

import '../../../../core/utils/api_client.dart';
import '../../../../data/models/payment_system.dart';
import '../../../../data/models/product.dart';
import '../../../../data/models/user.dart';
import '../../../../data/repositories/api_repository_impl.dart';
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
  TransactionTabState createState() => TransactionTabState();
}

class TransactionTabState extends State<TransactionTab> {
  bool _paymentDone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      color: context.color.profilePageBackground,
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

class EnterTxIdModal extends StatefulWidget {
  final Product product;
  final PaymentSystem paymentSystem;
  final VoidCallback onPaymentDone;

  const EnterTxIdModal({
    required this.product,
    required this.paymentSystem,
    required this.onPaymentDone,
    Key? key,
  }) : super(key: key);

  @override
  EnterTxIdModalState createState() => EnterTxIdModalState();
}

class EnterTxIdModalState extends State<EnterTxIdModal> with MessageOverlay {
  final TextEditingController _txIdController = TextEditingController();

  void _onSubmit() async {
    Navigator.of(context).pop();
    try {
      Response response = await createTransaction();
      if (response.statusCode == 200) {
        widget.onPaymentDone();
        showMessage(
          context.localizations.successfulPayment,
          Colors.green,
        );
      } else {
        showMessage(
          context.localizations.error + response.data['title'],
          Colors.red,
        );
      }
    } catch (e) {
      showMessage(context.localizations.error, Colors.red);

      debugPrint(e.toString());
    }
    showDialog(
        context: context, builder: (context) => _PaymentSuccessMessage());
  }

  Future<Response> createTransaction() async {
    try {
      // Request to get user profile, by user's token
      String key = html.window.localStorage["token"] ?? "";
      ApiClient apiClient = ApiClient(baseUrl: baseUrl, token: key);
      ApiRepositoryImpl apiRepository = ApiRepositoryImpl(apiClient: apiClient);
      Response response = await apiRepository.createPurchaseTransaction(
        widget.product.id,
        widget.paymentSystem.id,
        _txIdController.text,
      );
      if (apiRepository.isSuccessfulStatusCode(response.statusCode)) {
        widget.onPaymentDone();
        showMessage(
          context.localizations.successfulPayment,
          Colors.green,
        );
      } else {
        showMessage(
          context.localizations.error + response.data['title'],
          Colors.red,
        );
      }
      return response;
    } catch (e) {
      showMessage(context.localizations.error, Colors.red);

      debugPrint(e.toString());
    }
    return Response(requestOptions: RequestOptions(path: ''));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.localizations.enterTxId),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MessageChip.info(message: context.localizations.txIdInfo),
            const SizedBox(height: 20),
            Row(
              children: [
                MessageChip.warning(
                    message: context.localizations.txIdVerification),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _txIdController,
              style: context.text.profileBotsDefault.copyWith(fontSize: 16),
              decoration: InputDecoration(
                hintText: context.localizations.txId,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    // Paste functionality
                    ClipboardData? data =
                        await Clipboard.getData(Clipboard.kTextPlain);
                    if (data != null) {
                      _txIdController.text = data.text!;
                    }
                  },
                  icon: const Icon(Icons.content_paste),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TemporarilyDisabledColoredButton(
              title: context.localizations.submit,
              color: context.color.profilePagePrimary,
              onTap: _onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentSuccessMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: Responsive.isMobile(context)
            ? const EdgeInsets.all(10)
            : const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Column(
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
                            fontSize: 18,
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
                context.router.pushNamed('/profile');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionWindow extends StatefulWidget {
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
  State<_TransactionWindow> createState() => _TransactionWindowState();
}

class _TransactionWindowState extends State<_TransactionWindow>
    with MessageOverlay {
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
              _ProductDetails(product: widget.product),
              const Divider(),
              const SizedBox(height: 20),
              _GeneralInfo(
                accountEmail: currentUser?.email ?? '',
                accountName: currentUser?.login ?? '',
                price: widget.product.price.toString(),
              ),
              const SizedBox(height: 20),
              const _WarningWindow(),
              const SizedBox(height: 40),
              _DetailsTable(
                date: DateTime.now().toString(),
                paymentSystem: widget.paymentSystem.title,
                price: widget.product.price.toString(),
                requisites: widget.paymentSystem.key,
                status: 'Pending',
              ),
              const SizedBox(height: 20),
              MessageChip.info(
                message: context.localizations.prePaidInfoMessage,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    child: TemporarilyDisabledColoredButton(
                      disableDuration: 10,
                      title: context.localizations.paid,
                      color: context.color.profilePagePrimary,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => EnterTxIdModal(
                            product: widget.product,
                            paymentSystem: widget.paymentSystem,
                            onPaymentDone: widget.onPaymentDone,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 30),
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

class _ProductDetails extends StatelessWidget {
  final Product product;
  const _ProductDetails({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: context.color.profilePagePrimary.withOpacity(0.1),
        ),
        color: context.color.profilePagePrimary.withOpacity(0.1),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${context.localizations.youreBuying}:",
            style: context.text.profilePageBody.copyWith(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.title.toUpperCase(),
            style: context.text.profilePageBody.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.description,
            style: context.text.profilePageBody.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "${context.localizations.subscriptionDuration} ${product.subscriptionDuration} day(s)",
            style: context.text.profilePageBody.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
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
                  .copyWith(fontWeight: FontWeight.w800, fontSize: 18),
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
                fontWeight: index == 0 || index == 3 ? FontWeight.bold : null,
              ),
              textAlign: Responsive.isMobile(context) ? TextAlign.center : null,
            ),
          ),
        ],
      ),
    );
  }
}
