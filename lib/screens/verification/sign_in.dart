import 'package:flutter/material.dart';
import 'package:soko_v2/services/sign_in_with_google.dart';
import 'package:soko_v2/widgets/primary_icon_filled_button.dart';
import 'package:soko_v2/screens/profile/profile.dart';

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
                'Welcome to SOKO',
                style: TextStyle(fontSize: 48.8, fontWeight: FontWeight.w900),
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
                          builder: (context) => ProfileScreen(
                            name: userCredential.user!.displayName ??
                                "No Name Provided",
                            email: userCredential.user!.email!,
                          ),
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

// class HomePage extends StatelessWidget {
//   final String email;

//   const HomePage({super.key, required this.email});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Welcome'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             stops: const [0.12, 1.0],
//             colors: [
//               const Color(0xFFF4C3C3).withOpacity(0.46),
//               const Color(0xFFF4C3C3).withOpacity(1.0),
//             ],
//           ),
//         ),
//         child: Center(
//           child: Text(
//             'Hello $email, you have been successfully logged in',
//             style: const TextStyle(fontSize: 20),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
