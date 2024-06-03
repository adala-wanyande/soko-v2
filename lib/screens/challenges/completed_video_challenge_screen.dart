// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CompletedVideoChallengeScreen extends StatefulWidget {
  const CompletedVideoChallengeScreen({super.key});

  @override
  _VideoChallengeScreenState createState() => _VideoChallengeScreenState();
}

class _VideoChallengeScreenState extends State<CompletedVideoChallengeScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _videoWatched = false;
  String? _discountCode;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/challenges/mr_price.mp4', // Replace with your video path
    )..initialize().then((_) {
        setState(() {}); // Update the UI when the video is loaded
      });

    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        setState(() {
          _videoWatched = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _isPlaying = _controller.value.isPlaying;
    });
  }

  void _restart() {
    _controller.seekTo(Duration.zero);
    _controller.pause();
    setState(() {
      _isPlaying = false;
      _videoWatched = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mr Price Video Challenge'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16.0),
                if (_controller.value.isInitialized)
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: VideoPlayer(_controller),
                          ),
                          if (!_isPlaying)
                            IconButton(
                              icon: const Icon(Icons.play_arrow,
                                  size: 64, color: Colors.white),
                              onPressed: _playPause,
                            ),
                        ],
                      ),
                    ),
                  )
                else
                  const CircularProgressIndicator(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _playPause,
                      child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _restart,
                      child: const Icon(Icons.restart_alt),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StepWidget(stepText: 'Watch the video'),
                  StepWidget(stepText: 'Share the video to claim the discount'),
                  StepWidget(stepText: 'Claim discount code'),
                ],
                
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Discount Code : MRP20OFF',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StepWidget extends StatelessWidget {
  final String stepText;

  const StepWidget({required this.stepText, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          const Icon(Icons.check_circle_outline, color: Colors.green),
          const SizedBox(width: 8.0),
          Text(
            stepText,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
 

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CompletedVideoChallengeScreen(),
    ),
  );
}

