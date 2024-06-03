import 'package:flutter/material.dart';

class LocationProgressScreen extends StatelessWidget {
  final String title;

  const LocationProgressScreen({required this.title, super.key});

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
