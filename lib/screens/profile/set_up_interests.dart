import 'package:flutter/material.dart';
import 'package:soko_v2/screens/dashboard/dashboard.dart';

class SetUpInterestScreen extends StatefulWidget {
  const SetUpInterestScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SetUpInterestPageState createState() => _SetUpInterestPageState();
}

class _SetUpInterestPageState extends State<SetUpInterestScreen> {
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.of(context).pop();
            //TODO: navigate back to previous page
          },
        ),
        title: Center(
          child: Text(
            "Set Up Interests",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 96.0),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Tell us about your interests',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          const SizedBox(height: 96.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: interests.map((interest) {
                  return ChoiceChip(
                    label: Text(interest),
                    selected: isSelected(interest),
                    onSelected: (selected) {
                      toggleInterest(interest);
                    },
                    backgroundColor: isSelected(interest)
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary,
                    selectedColor: Theme.of(context).colorScheme.primary,
                  );
                }).toList(),
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
                            builder: (context) => const MainScreen()),
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
                'Continue',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
