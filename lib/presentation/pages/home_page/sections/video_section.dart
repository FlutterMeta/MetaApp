import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:universal_html/html.dart' as html;

class VideoSection extends StatelessWidget {
  static const _videos = <_VideoModel>[
    _VideoModel(
      title: "Video presentation of MultiMeta™ Universe",
      source: "https://www.youtube.com/embed/x6W1n1mM2T8",
    ),
    _VideoModel(
      title: "Presentation interview with a top manager",
      source: "https://www.youtube.com/embed/-5_hARARBRI",
    ),
    _VideoModel(
      title: "About the financial component of MultiMeta",
      source: "https://www.youtube.com/embed/aTB6q-1thnQ",
    ),
    _VideoModel(
      title: "Prospects for creating a virtual world",
      source: "https://www.youtube.com/embed/riTGBEXVyAc",
    ),
  ];

  const VideoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: _videos
          .map(
            (video) => _Video(model: video),
          )
          .toList(),
    );
  }
}

class _Video extends StatelessWidget {
  final _VideoModel model;

  const _Video({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      model.id,
      (int id) => html.IFrameElement()
        ..style.width = "300px"
        ..style.height = "216px"
        ..src = model.source
        ..style.borderRadius = "10px"
        ..style.boxShadow = " 0px 6px 28px -4px rgb(136 130 226 / 100%)"
        ..style.border = 'none',
    );

    return SizedBox(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 216,
            child: HtmlElementView(
              viewType: model.id,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            model.title,
            style: context.text.videoTitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _VideoModel {
  final String title;
  final String source;

  String get id => source.split("/").last;

  const _VideoModel({
    required this.title,
    required this.source,
  });
}
