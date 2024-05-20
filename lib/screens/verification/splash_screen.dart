import 'package:flutter/material.dart';
import 'package:soko_v2/screens/verification/get_started.dart';
import 'dart:async';
// import 'package:soko_v2/screens/verification/sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start the timer
    Timer(
      const Duration(seconds: 3), // Adjust the duration as needed
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              const GetStartedScreen(), // Navigate to SignIn screen
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xfff4c3c3), Color(0xffff0080)],
              ),
            ),
          ),
          const Center(
            child: CircleAvatar(
              radius: 150.0,
              backgroundImage: AssetImage('assets/logos/soko.png'),
            ),
          ),
        ],
      ),
    );
  }
}
