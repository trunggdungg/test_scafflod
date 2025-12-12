import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class videoEx extends StatefulWidget {
  const videoEx({super.key});

  @override
  State<StatefulWidget> createState() => _videoExState();
}

class _videoExState extends State<videoEx> {
  late VideoPlayerController _controller;  ///khởi tạo VideoPlayerController
  late Future<void> _initializeVideoPlayerFuture; ///dùng FutureBuilder để chờ video load xong.


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
    );

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {///Giúp tránh memory leak khi thoát màn hình.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('GeeksForGeeks'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,///chờ video load xong
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading video: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading video...'),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
