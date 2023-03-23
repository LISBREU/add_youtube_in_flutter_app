import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const YouTubeExample(),
    );
  }
}

class YouTubeExample extends StatefulWidget {
  const YouTubeExample({super.key});

  @override
  State<YouTubeExample> createState() => _YouTubeExampleState();
}

class _YouTubeExampleState extends State<YouTubeExample> {
  final videoURl = "https://www.youtube.com/watch?v=nxomqBBla_Y";
  late YoutubePlayerController _controller;


  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURl);

    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      )
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Are You Ready For Something Good?')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () => debugPrint('Ready'),
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),

              ),
              const PlaybackSpeedButton(),
            ],

            ), 
        ],
      ),
    );
  }
}