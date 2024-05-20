import 'package:flutter/material.dart';

class SecondaryIconFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryIconFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        foregroundColor: Colors.white, // Ensure foreground colors are white
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Keep the content compact
        children: [
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(width: 8), // Space between text and icon
          Icon(
            Icons.arrow_forward,
            color: Theme.of(context).colorScheme.primary,
            size: 20.0, // Optional: adjust size as needed
          ),
        ],
      ),
    );
  }
}
