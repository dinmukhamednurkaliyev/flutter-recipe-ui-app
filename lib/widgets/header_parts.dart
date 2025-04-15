import 'package:flutter/material.dart';

/// A widget that displays the header part of the home page.
class HeaderParts extends StatelessWidget {
  /// Creates a new instance of [HeaderParts].
  const HeaderParts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Hello Dinmukhamed,\n',
                  style: TextStyle(fontSize: 16),
                ),
                TextSpan(
                  text: 'What do you want to eat today?',
                  style: TextStyle(fontSize: 13, color: Colors.black45),
                ),
              ],
            ),
          ),
          const Spacer(),
          Stack(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/181092805?v=4',
                ),
              ),
              Positioned(
                right: 1,
                top: 1,
                child: Container(
                  height: 9,
                  width: 9,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
