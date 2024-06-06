import 'package:flutter/material.dart';
import 'package:soko_v2/widgets/challenge_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Discover Challenges',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 32),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(children: [
                      buildChallengeCard(
                        'LC Waikiki',
                        'Image Challenge',
                        'Get a 50% discount lorem ipsum yappa',
                        'assets/stores/lc_waikiki.png', // Example image path
                        context,
                      ),
                      const SizedBox(width: 8),
                      buildChallengeCard(
                        'The North Face',
                        'Location Challenge',
                        'Get 5% off your next purchase lorem ipsum yappa',
                        'assets/stores/north_face.png', // Example image path
                        context,
                      ),
                    ]),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        buildChallengeCard(
                          'Mr Price',
                          'Video Challenge',
                          'Complete this video challenge to get discount yappa yappa yappa',
                          'assets/stores/mr_price.png', // Example image path
                          context,
                        ),
                        const SizedBox(width: 8),
                        buildChallengeCard(
                          'Carrefour',
                          'QR Code Challenge',
                          'Complete this QR Code challenge to get discount yappa yappa yappa',
                          'assets/stores/carrefour.png', // Example image path
                          context,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ])));
  }
}
