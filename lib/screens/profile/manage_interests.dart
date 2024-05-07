import 'package:flutter/material.dart';
import 'package:soko_v2/screens/dashboard/dashboard.dart';
import 'package:soko_v2/screens/profile/profile.dart';

class ManageInterestScreen extends StatefulWidget {
  const ManageInterestScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ManageInterestPageState createState() => _ManageInterestPageState();
}

class _ManageInterestPageState extends State<ManageInterestScreen> {
  List<String> selectedInterests = [];

  List<String> interests = [
    "Fashion",
    "Electronics",
    "Beauty",
    "Food",
    "Home",
    "Sports",
    "Books",
    "Entertainment",
    "Jewelry",
    "Services",
    "Kids",
    "Specialty",
  ];

  bool isSelected(String interest) {
    return selectedInterests.contains(interest);
  }

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center( 
          child: Text(
            "Manage Interests",
            style: Theme.of(context).textTheme.headlineMedium,
            ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32.0),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'My interests',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          const SizedBox(height: 32.0),
          Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (selectedInterests.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Selected Interests',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8.0),
                        Wrap( 
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: selectedInterests.map((interest) {
                            return _buildInterestChip(interest, true);
                          }).toList(),
                        ),
                        const SizedBox(height: 16.0),
                        const Divider(),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                  Text(
                    'Choose more Interests',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: interests.map((interest) {
                      return _buildInterestChip(interest, false);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 72.0),
            child: ElevatedButton(
              onPressed: selectedInterests.isNotEmpty
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedInterests.isNotEmpty
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'Save',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                )
                
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildInterestChip(String interest, bool selected) {
    return ChoiceChip(
      label: Text(interest),
      selected: selected,
      onSelected: (isSelected) {
        toggleInterest(interest);
      },
      backgroundColor: selected
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.secondary,
      selectedColor: Theme.of(context).colorScheme.primary,
    );
  }
}