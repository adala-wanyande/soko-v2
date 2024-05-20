import 'package:flutter/material.dart';

Widget buildPageIndicator(int currentPage) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(3, (index) {
      return Container(
        width: 8,
        height: 8,
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 128),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == currentPage
              ? Colors.white
              : Colors.white.withOpacity(0.5),
        ),
      );
    }),
  );
}
