import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:share_plus/share_plus.dart';

class ImageChallengeScreen extends StatefulWidget {
  final String title;

  const ImageChallengeScreen({required this.title, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageChallengeScreenState createState() => _ImageChallengeScreenState();
}

class _ImageChallengeScreenState extends State<ImageChallengeScreen> {
  bool _imageFlipped = false;
  bool _imageShared = false;
  String? _discountCode;

  void _onFlipDone() {
    setState(() {
      _imageFlipped = true;
    });
  }

  Future<void> _onShare() async {
    await Share.share(
        'Check out this image challenge from LC Waikiki!'); // Customize the share message
    setState(() {
      _imageShared = true;
      _discountCode = 'LC50OFF'; // Set the discount code
    });
    _showDiscountDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              FlipCard(
                direction: FlipDirection.HORIZONTAL,
                onFlipDone: (status) {
                  _onFlipDone();
                },
                front: Card(
                  elevation: 8,
                  child: Container(
                    height: 350,
                    width: 350,
                    alignment: Alignment.center,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image, size: 50, color: Colors.grey),
                        Text('Flip Me', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                back: Card(
                  elevation: 8,
                  child: Container(
                    height: 350,
                    width: 350,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/challenges/lc_waikiki.png'), // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _imageFlipped ? _onShare : null,
                child: const Text('Share image'),
              ),
              const SizedBox(height: 40),
              Text(
                'Challenge Instructions',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: _buildProgressStep(
                    '1. Flip the card to see the image', _imageFlipped),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: _buildProgressStep(
                    '2. Share the image to claim the discount', _imageShared),
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
          content: const Text('Here is your discount code: LC50OFF'),
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
