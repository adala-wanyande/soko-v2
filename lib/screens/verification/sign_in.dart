// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
// import 'package:soko_v2/screens/dashboard/dashboard.dart';
import 'package:soko_v2/screens/profile/set_up_interests.dart';
import 'package:soko_v2/services/sign_in_with_google.dart';
import 'package:soko_v2/widgets/primary_icon_filled_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.12, 1.0],
            colors: [
              const Color(0xFFF4C3C3).withOpacity(0.46),
              const Color(0xFFF4C3C3).withOpacity(1.0),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Get Started With SOKO',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 300),
              PrimaryIconFilledButton(
                text: 'Sign in with Google',
                onPressed: () async {
                  final userCredential = await signInWithGoogle();
                  if (userCredential.user != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SetUpInterestScreen(),
                        ));
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                        title: Text('Sign in Error'),
                        content: Text('Failed to sign in with Google.'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
