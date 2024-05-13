// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko_v2/screens/profile/edit_profile.dart';
import 'package:soko_v2/screens/profile/manage_interests.dart';
import 'package:soko_v2/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soko_v2/screens/verification/sign_in.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SignInScreen()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Logout Error'),
          content: Text('Failed to log out: $e'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog first
                _signOut(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: userProfile.when(
        data: (user) {
          final String name = user?.displayName ?? 'No Name Provided';
          final String email = user?.email ?? 'No Email Provided';

          return Center(
            child: ListView(
              children: [
                const SizedBox(height: 60),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: const Icon(Icons.person, size: 50),
                ),
                const SizedBox(height: 20),
                Text(name,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: 10),
                Text(email,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 60),
                _buildListTile(context, Icons.person, 'Personal Information',
                    () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditProfileScreen(name: name, email: email)));
                }),
                _divider(context),
                _buildListTile(context, Icons.favorite, 'Manage Interests', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ManageInterestScreen()));
                }),
                _divider(context),
                _buildListTile(context, Icons.settings, 'Settings', () {
                  // Navigate to Settings Screen
                }),
                _divider(context),
                _buildListTile(context, Icons.logout, 'Log Out', () {
                  _showSignOutDialog(context);
                }),
              ],
            ),
          );
        },
        error: (error, _) => Center(child: Text('Error: ${error.toString()}')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Divider _divider(BuildContext context) {
    return Divider(
      height: 10,
      thickness: 1,
      indent: 20,
      endIndent: 20,
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  ListTile _buildListTile(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title),
      titleTextStyle: Theme.of(context).textTheme.bodyMedium,
      trailing: Icon(Icons.arrow_forward,
          color: Theme.of(context).colorScheme.primary),
      onTap: onTap,
    );
  }
}
