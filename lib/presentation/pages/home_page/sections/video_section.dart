import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1270) {
            return const _VideoGrid(
              constraints: BoxConstraints(maxWidth: 1270),
              crossAxisCount: 4,
              height: 216,
            );
          } else if (constraints.maxWidth >= 780) {
            return const _VideoGrid(
              constraints: BoxConstraints(maxWidth: 650),
              crossAxisCount: 2,
              height: 600,
            );
          } else {
            return const _VideoGrid(
              constraints: BoxConstraints(maxWidth: 300),
              crossAxisCount: 1,
              height: 1124,
            );
          }
        },
      ),
    );
  }
}

class _YoutubeVideo extends StatelessWidget {
  final String videoID;
  final String videoSource;

  const _YoutubeVideo({
    required this.videoID,
    required this.videoSource,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      videoID,
      (int id) => html.IFrameElement()
        ..style.width = "300px"
        ..style.height = "216px"
        ..src = videoSource
        ..style.borderRadius = "10px"
        ..style.boxShadow = " 0px 6px 28px -4px rgb(136 130 226 / 100%)"
        ..style.border = 'none',
    );

    return HtmlElementView(
      viewType: videoID,
    );
  }
}

class _VideoGrid extends StatelessWidget {
  final int crossAxisCount;
  final BoxConstraints constraints;
  final double height;

  const _VideoGrid({
    required this.crossAxisCount,
    required this.constraints,
    required this.height,
    Key? key,
  }) : super(key: key);

  static const source = "source";
  static const id = "id";

  static const videoSourcesList = [
    {
      source: "https://www.youtube.com/embed/x6W1n1mM2T8",
      id: "x6W1n1mM2T8",
    },
    {
      source: "https://www.youtube.com/embed/-5_hARARBRI",
      id: "-5_hARARBRI",
    },
    {
      source: "https://www.youtube.com/embed/aTB6q-1thnQ",
      id: "aTB6q-1thnQ",
    },
    {
      source: "https://www.youtube.com/embed/riTGBEXVyAc",
      id: "riTGBEXVyAc",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      height: height,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 20,
        crossAxisCount: crossAxisCount,
        children: videoSourcesList
            .map(
              (video) => _YoutubeVideo(
                videoID: video[id] as String,
                videoSource: video[source] as String,
              ),
            )
            .toList(),
      ),
    );
  }
}
