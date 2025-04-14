// ignore_for_file: prefer_single_quotes

import 'package:flutter/material.dart';
import 'package:flutter_recipe_ui_app/theme/colors/colors.dart';

/// A page that serves as the home screen of the app.
class HomePage extends StatefulWidget {
  /// Creates a new instance of [HomePage].
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: recipeAppBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
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
                          "https://avatars.githubusercontent.com/u/181092805?v=4",
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
            ),
          ],
        ),
      ),
    );
  }
}
