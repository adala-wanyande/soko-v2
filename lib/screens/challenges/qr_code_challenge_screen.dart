import 'package:flutter/material.dart';

class QRCodeChallengeScreen extends StatelessWidget {
  final String title;

  const QRCodeChallengeScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Details of $title QR Code Challenge'),
      ),
    );
  }
}
