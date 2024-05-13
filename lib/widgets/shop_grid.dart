import 'package:flutter/material.dart';

class ShopGrid extends StatelessWidget {
  final List<String> logos;

  const ShopGrid({super.key, required this.logos});

  @override
  Widget build(BuildContext context) {
    final Color borderColor = Theme.of(context).colorScheme.secondary;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Changed from 4 to 2 for a 2x2 grid
        childAspectRatio: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: logos.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 2),
          ),
          child: ClipOval(
            child: Image.asset(logos[index], fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
