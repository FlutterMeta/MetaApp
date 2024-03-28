import 'package:flutter/material.dart';
import 'package:meta_app/core/mixins/message_overlay.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:slider_captcha/slider_captcha.dart';

class CaptchaDialog extends StatefulWidget {
  final SliderController sliderCaptchaController;
  final String assetPath;
  final Function onConfirm;

  const CaptchaDialog({
    required this.sliderCaptchaController,
    required this.assetPath,
    required this.onConfirm,
    Key? key,
  }) : super(key: key);

  @override
  State<CaptchaDialog> createState() => _CaptchaDialogState();
}

class _CaptchaDialogState extends State<CaptchaDialog> with MessageOverlay {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.color.postBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(context.localizations.captcha),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(context.localizations.cancel),
        ),
      ],
      content: SliderCaptcha(
        controller: widget.sliderCaptchaController,
        title: context.localizations.sliderCaptchaTitle,
        titleStyle: context.text.authFormHint,
        imageToBarPadding: 10,
        image: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
                width: 3, color: context.color.profilePageAboveBackground),
            color: context.color.profilePageBackground,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              widget.assetPath,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        colorBar: context.color.profilePageBackground, //slider color
        colorCaptChar:
            context.color.profilePageAboveBackground, //puzzle hole place
        onConfirm: (value) async {
          Future.delayed(const Duration(seconds: 1));
          if (value) {
            widget.onConfirm();
            Navigator.of(context).pop();
          } else {
            showMessage(
              context.localizations.captchaFailed,
              Colors.red,
            );
          }
        },
      ),
    );
  }
}
