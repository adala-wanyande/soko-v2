import 'package:flutter/material.dart';
import 'package:soko_v2/screens/challenges/completed_image_challenge_screen.dart';
import 'package:soko_v2/screens/challenges/completed_video_challenge_screen.dart';
import 'package:soko_v2/screens/challenges/completed_location_challenge_screen.dart';

Widget buildCompletedCard(String title, String subtitle, String description,
    String imagePath, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Widget screen;
      if (subtitle.contains('Image Challenge')) {
        screen = CompletedImageChallengeScreen(title: title);
      } else if (subtitle.contains('Video Challenge')) {
        screen = const CompletedVideoChallengeScreen();
      } else if (subtitle.contains('Location Challenge')) {
        screen = CompletedLocationChallengeScreen(title: title);
      } 
      else {
        screen = Scaffold(
          appBar: AppBar(title: Text(title)),
          body: const Center(child: Text('Challenge type not recognized')),
        );
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    },
    child: SizedBox(
      width: 200,
      child: Card(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  const Icon(Icons.check_circle, color: Colors.green),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'See more',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
