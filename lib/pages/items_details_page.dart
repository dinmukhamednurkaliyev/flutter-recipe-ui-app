import 'package:flutter/material.dart';
import 'package:flutter_recipe_ui_app/models/recipe.dart';

/// A page that displays the details of items.
class ItemsDetailsPage extends StatefulWidget {
  /// Creates a new instance of [ItemsDetailsPage].
  const ItemsDetailsPage({required this.recipeItems, super.key});

  /// The recipe items to be displayed on this page.
  final RecipeItems recipeItems;

  @override
  State<ItemsDetailsPage> createState() => _ItemsDetailsPageState();
}

class _ItemsDetailsPageState extends State<ItemsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.55,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.recipeItems.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
