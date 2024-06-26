import 'package:flutter/material.dart';
import 'package:soko_v2/widgets/progress_card.dart';
//import 'package:soko_v2/widgets/challenge_card.dart';
import 'package:soko_v2/widgets/completed_card.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenges'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Challenges',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            
            const SizedBox(height: 32),
            Text(
              'In progress',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildProgressCard(
                    'LC Waikiki',
                    'Image Challenge',
                    '5% off your next purchase, visit now!',
                    'assets/stores/lc_waikiki.png',
                    0.5,
                    context,
                  ),
                  const SizedBox(width: 8),
                  buildProgressCard(
                    'Mr Price',
                    'Video Challenge',
                    '10% discount on all products lorem lorem lorem',
                    'assets/stores/mr_price.png',
                    0.8,
                    context,
                  ),
                  const SizedBox(width: 8),
                  buildProgressCard(
                    'The North Face',
                    'Location Challenge',
                    '5% discount on all items lorem lorem lorem',
                    'assets/stores/north_face.png',
                    0.6,
                    context,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Completed',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCompletedCard(
                    'The North Face',
                    'Location Challenge',
                    'Get 5% off your next purchase lorem ipsum yappa',
                    'assets/stores/north_face.png',
                    context,
                  ),
                  const SizedBox(width: 8),
                  buildCompletedCard(
                    'Mr Price',
                    'Video Challenge',
                    'Complete this video challenge to get discount yappa yappa yappa',
                    'assets/stores/mr_price.png', // Example image path
                    context,
                  ),
                  const SizedBox(width: 8),
                  buildCompletedCard(
                    'LC Waikiki',
                    'Image Challenge',
                    'Get a 50% discount lorem ipsum yappa',
                    'assets/stores/lc_waikiki.png',
                    context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
