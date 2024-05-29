import 'package:flutter/material.dart';

class LocationChallengeScreen extends StatelessWidget {
  final String title;

  const LocationChallengeScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Details of $title Location Challenge'),
      ),
    );
  }
}
