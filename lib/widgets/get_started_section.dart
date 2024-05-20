// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:soko_v2/services/sign_in_with_google.dart';
import 'package:soko_v2/screens/profile/set_up_interests.dart';
import 'package:soko_v2/widgets/secondary_icon_filled_button.dart';

Widget buildPage(BuildContext context, String imagePath, String description,
    {bool isLastPage = false}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const SizedBox(height: 20),
      Image.asset(imagePath, height: 200),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64.0),
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.white),
        ),
      ),
      const SizedBox(height: 30),
      if (isLastPage)
        SecondaryIconFilledButton(
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
  );
}
