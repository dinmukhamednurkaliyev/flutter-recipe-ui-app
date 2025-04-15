// ignore_for_file: prefer_single_quotes

import 'package:flutter/material.dart';
import 'package:flutter_recipe_ui_app/models/recipe.dart';
import 'package:flutter_recipe_ui_app/theme/colors/colors.dart';
import 'package:flutter_recipe_ui_app/widgets/header_parts.dart';
import 'package:flutter_recipe_ui_app/widgets/search_field.dart';
import 'package:iconsax/iconsax.dart';

/// A page that serves as the home screen of the app.
class HomePage extends StatefulWidget {
  /// Creates a new instance of [HomePage].
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: recipeAppBackground,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderParts(),
            const SizedBox(height: 30),
            const SearchField(),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular menus',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            popularMenuItems(),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(recipeItems.length, (index) {
                  final recipe = recipeItems[index];
                  return Padding(
                    padding:
                        index == 0
                            ? const EdgeInsets.only(left: 20, right: 10)
                            : const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 260,
                        width: MediaQuery.of(context).size.width / 2.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(recipe.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView popularMenuItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          menuItems.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {});
                selectedIndex = index;
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      if (selectedIndex == index)
                        Colors.green
                      else
                        Colors.white,
                      if (selectedIndex == index)
                        Colors.greenAccent
                      else
                        Colors.white,
                    ],
                  ),
                ),
                child: Text(
                  menuItems[index],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight:
                        selectedIndex == index
                            ? FontWeight.bold
                            : FontWeight.w500,
                    color: selectedIndex == index ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
