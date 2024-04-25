import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit:StackFit.expand,
        children: <Widget>[
        Container(
        decoration: const BoxDecoration(
         gradient: RadialGradient(
          colors: [Color(0xfff4c3c3), Color(0xffff0080)],
          center: Alignment.center,
          radius: 1.0,
          stops: [0.4,1.0],
          tileMode: TileMode.clamp      ),
    ),
        ),
  Center(
      child: CircleAvatar(
        radius: 150.0,
        backgroundImage: AssetImage('lib/assets/SOKO-final logo.png'),
            
        ),
      ),
        ],
      ),
    );
}
}