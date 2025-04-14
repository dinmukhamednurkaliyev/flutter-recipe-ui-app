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
    return const Scaffold(
      backgroundColor: recipeAppBackground,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Hello Dima, \n",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
