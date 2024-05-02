import 'package:flutter/material.dart';
import 'package:soko_v2/screens/profile/edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String email;

  const ProfileScreen({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 60,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const Icon(Icons.person,
                  size: 50), // Using an icon instead of an image
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              email,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              leading: Icon(Icons.person,
                  color: Theme.of(context).colorScheme.primary),
              title: const Text('Personal Information'),
              titleTextStyle: Theme.of(context).textTheme.bodyMedium,
              trailing: Icon(Icons.arrow_forward,
                  color: Theme.of(context).colorScheme.primary),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EditProfileScreen(name: name, email: email),
                    ));
              },
            ),
            Divider(
              height: 10,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              leading: Icon(Icons.favorite,
                  color: Theme.of(context).colorScheme.primary),
              title: const Text('Manage Interests'),
              titleTextStyle: Theme.of(context).textTheme.bodyMedium,
              trailing: Icon(Icons.arrow_forward,
                  color: Theme.of(context).colorScheme.primary),
              onTap: () {
                // Navigate to Manage Interests Screen
              },
            ),
            Divider(
              height: 10,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              leading: Icon(Icons.settings,
                  color: Theme.of(context).colorScheme.primary),
              title: const Text('Settings'),
              titleTextStyle: Theme.of(context).textTheme.bodyMedium,
              trailing: Icon(Icons.arrow_forward,
                  color: Theme.of(context).colorScheme.primary),
              onTap: () {
                // Navigate to Settings Screen
              },
            ),
            Divider(
              height: 10,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              leading: Icon(Icons.logout,
                  color: Theme.of(context).colorScheme.primary),
              title: const Text('Log Out'),
              titleTextStyle: Theme.of(context).textTheme.bodyMedium,
              trailing: Icon(Icons.arrow_forward,
                  color: Theme.of(context).colorScheme.primary),
              onTap: () {
                // Log out logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
