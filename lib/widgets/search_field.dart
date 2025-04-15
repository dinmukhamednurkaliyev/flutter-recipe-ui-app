import 'package:flutter/material.dart';
import 'package:flutter_recipe_ui_app/theme/colors/colors.dart';
import 'package:iconsax/iconsax.dart';

/// A widget that displays a search field for the home page.
class SearchField extends StatelessWidget {
  /// Creates a new instance of [SearchField].
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: searchBarColor,
        ),
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Iconsax.search_normal, color: Colors.black45),
            hintText: 'Search',
            helperStyle: TextStyle(color: Colors.black26),
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}
