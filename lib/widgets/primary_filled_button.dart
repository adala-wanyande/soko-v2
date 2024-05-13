import 'package:flutter/material.dart';

class PrimaryFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryFilledButton({
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
        ],
      ),
    );
  }
}
