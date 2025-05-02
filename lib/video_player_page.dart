import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerPage({super.key, required this.videoUrl, required String title});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("How to Brush")),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) {
          return Column(
            children: [
              player,
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Watch this quick guide to learn the correct brushing technique!",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
