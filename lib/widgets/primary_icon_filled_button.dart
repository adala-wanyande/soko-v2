import 'package:flutter/material.dart';

class PrimaryIconFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryIconFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(width: 8), // Space between text and icon
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 20.0, // Optional: adjust size as needed
          ),
        ],
      ),
    );
  }
}
