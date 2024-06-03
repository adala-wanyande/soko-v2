// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProgressScreen extends StatefulWidget {
  const VideoProgressScreen({super.key});

  @override
  _VideoProgressScreenState createState() => _VideoProgressScreenState();
}

class _VideoProgressScreenState extends State<VideoProgressScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _isCompleted = false;
  bool _videoWatched = true;
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

  Future<void> _onShare() async {
    // Implement sharing functionality here
    setState(() {
      _isCompleted = true;
      _discountCode = 'MRP20OFF'; // Set the discount code
    });
    _showDiscountDialog();
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _videoWatched ? _onShare : null,
                  child: const Text('Share video'),
                ),
                const SizedBox(height: 40),
                Text(
                  'Challenge Instructions',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child:
                      _buildProgressStep('1. Watch the video', _videoWatched),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: _buildProgressStep(
                      '2. Share the video to claim the discount', _isCompleted),
                ),
                if (_discountCode != null) ...[
                  const SizedBox(height: 40),
                  Text(
                    'Your Discount Code',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _discountCode!,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressStep(String text, bool isCompleted) {
    return Row(
      children: [
        Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
      ],
    );
  }

  void _showDiscountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulations!'),
          content: const Text('Here is your discount code: MRP20OFF'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoProgressScreen(),
    ),
  );
}
