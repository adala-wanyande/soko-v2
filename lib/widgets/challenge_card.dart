import 'package:flutter/material.dart';
import 'package:soko_v2/screens/challenges/image_challenge_screen.dart';
import 'package:soko_v2/screens/challenges/location_challenge_screen.dart';
import 'package:soko_v2/screens/challenges/qr_code_challenge_screen.dart';
import 'package:soko_v2/screens/challenges/video_challenge_screen.dart';

Widget buildChallengeCard(String title, String subtitle, String description,
    String imagePath, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Widget screen;
      if (subtitle.contains('Video Challenge')) {
        screen = const VideoChallengeScreen();
      } else if (subtitle.contains('Image Challenge')) {
        screen = ImageChallengeScreen(title: title);
      } else if (subtitle.contains('QR Code Challenge')) {
        screen = QRCodeChallengeScreen(title: title);
      } else if (subtitle.contains('Location Challenge')) {
        screen = LocationChallengeScreen(title: title);
      } else {
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
