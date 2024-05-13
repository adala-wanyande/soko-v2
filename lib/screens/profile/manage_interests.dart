// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:soko_v2/screens/profile/profile.dart';

class ManageInterestScreen extends StatefulWidget {
  const ManageInterestScreen({super.key});

  @override
  _ManageInterestPageState createState() => _ManageInterestPageState();
}

class _ManageInterestPageState extends State<ManageInterestScreen> {
  List<String> selectedInterests = [
    'Fashion',
    'Electronics'
  ]; // Default selected interests

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
      if (isSelected(interest)) {
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
        title: const Text('Manage Interests'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                          'Your Selected Interests',
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
                        const SizedBox(height: 24.0),
                      ],
                    ),
                  Text(
                    'Choose More Interests',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: interests
                        .where((i) => !selectedInterests.contains(i))
                        .map((interest) {
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
                  )),
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Save',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: selectedInterests.isNotEmpty
                              ? Colors.white
                              : Colors.black,
                        ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInterestChip(String interest, bool selected) {
    return ChoiceChip(
      label: Text(
        interest,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
        ),
      ),
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
