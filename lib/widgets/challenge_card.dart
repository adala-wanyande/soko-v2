import 'package:flutter/material.dart';

Widget buildChallengeCard(
    String title, String subtitle, String description, BuildContext context) {
  return SizedBox(
    width: 200,
    child: Card(
      child: Column(
        children: [
          Container(
            height: 160,
            color: Colors.black,
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
  );
}
