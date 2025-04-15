import 'package:flutter/material.dart';

/// A widget that displays a section title with a "See all" link.
class SectionTitle extends StatelessWidget {
  /// Creates a new instance of [SectionTitle].
  const SectionTitle({required this.title, super.key});

  /// The title of the section.
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const Text(
            'See all',
            style: TextStyle(
              fontSize: 14,
              color: Colors.green,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
