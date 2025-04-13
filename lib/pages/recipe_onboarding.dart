import 'package:flutter/material.dart';

/// A page that provides onboarding information for recipes.
class RecipeOnboardingPage extends StatefulWidget {
  /// Creates a new instance of [RecipeOnboardingPage].
  const RecipeOnboardingPage({super.key});

  @override
  State<RecipeOnboardingPage> createState() => _RecipeOnboardingPageState();
}

class _RecipeOnboardingPageState extends State<RecipeOnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.white, body: Column());
  }
}
