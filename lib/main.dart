import 'package:flutter/material.dart';
import 'package:test2/video_player_item.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const VideoApp());

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  final videoList = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 1000; i++) {
      final url = i % 2 == 0
          ? 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
          : 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
      videoList.add({
        'videoUrl': url,
      });
    }
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: PageView.builder(
          itemCount: videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = videoList[index];
            return VideoPlayerItem(
              videoUrl: data['videoUrl']!,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.play_arrow,
          ),
        ),
      ),
    );
  }
}
