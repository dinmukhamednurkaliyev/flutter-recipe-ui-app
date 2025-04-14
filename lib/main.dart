import 'package:flutter/material.dart';
import 'package:flutter_recipe_ui_app/pages/recipe_onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

/// A simple Flutter application that serves as the entry point for the app.
class MyApp extends StatelessWidget {
  /// Creates a new instance of [MyApp].
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipeOnboardingPage(),
    );
  }
}
