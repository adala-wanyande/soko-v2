import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko_v2/screens/profile/edit_profile.dart';
import 'package:soko_v2/providers/auth_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

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
                            EditProfileScreen(name: name, email: email)),
                  );
                }),
                _divider(context),
                _buildListTile(context, Icons.favorite, 'Manage Interests', () {
                  // Navigate to Manage Interests Screen
                }),
                _divider(context),
                _buildListTile(context, Icons.settings, 'Settings', () {
                  // Navigate to Settings Screen
                }),
                _divider(context),
                _buildListTile(context, Icons.logout, 'Log Out', () {
                  // Log out logic
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
