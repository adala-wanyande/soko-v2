import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  final String name;
  final String email;

  const EditProfileScreen({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Information'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20), // Padding around the ListView
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .secondary, // Color of the border
                  width: 2.0, // Width of the border
                ),
                borderRadius: BorderRadius.circular(
                    10), // Optional: to make the corners rounded
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, size: 30),
                      onPressed: () {
                        // Add logic to edit profile picture
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Tap the icon to update your profile picture.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              leading: Icon(Icons.person,
                  color: Theme.of(context).colorScheme.primary),
              title: Text(
                name,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Add logic for editing name
                },
              ),
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
              leading: Icon(Icons.email,
                  color: Theme.of(context).colorScheme.primary),
              title: Text(
                email,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Add logic for editing email
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
