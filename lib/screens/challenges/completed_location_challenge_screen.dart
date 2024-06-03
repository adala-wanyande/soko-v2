import 'package:flutter/material.dart';


class CompletedLocationChallengeScreen extends StatefulWidget {
  final String title;

  const CompletedLocationChallengeScreen({required this.title, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CompletedLocationChallengeScreenState createState() => _CompletedLocationChallengeScreenState();
}

class _CompletedLocationChallengeScreenState extends State<CompletedLocationChallengeScreen> {
 

  

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
            children: <Widget>[
              Image.asset(
                'assets/challenges/the_north_face.png', // Make sure to add your image in assets
                height: 300,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'You were near a participating store! 5% off your purchase',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StepWidget(stepText: 'Walk towards a participating store'),
                  StepWidget(stepText: 'Arrival at store'),
                  StepWidget(stepText: 'Claim discount code'),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Discount Code : WTJS56SHD',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ],
          ),
        ),
      ),
    );
  }
}

  class StepWidget extends StatelessWidget {
  final String stepText;

  const StepWidget({required this.stepText, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          const Icon(Icons.check_circle_outline, color: Colors.green),
          const SizedBox(width: 8.0),
          Text(
            stepText,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}



