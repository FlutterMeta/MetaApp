import 'package:flutter/material.dart';

///separate class which describes background widget for all pages
class BackgroundWidget extends StatelessWidget {
  ///child widget
  final Widget? child;

  ///to be on top of the tree child parameter needed
  const BackgroundWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [
            0.01,
            0.89,
          ],
          colors: [
            Color.fromARGB(255, 169, 161, 184),
            Colors.white,
          ],
        ),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
