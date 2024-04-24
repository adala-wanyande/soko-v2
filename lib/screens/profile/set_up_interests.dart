import 'package:flutter/material.dart';

class SetUpInterestsScreen extends StatelessWidget {
  const SetUpInterestsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Up Your Interests'),
      ),
      body: const Center(
        child: Text('Setup Interests Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
