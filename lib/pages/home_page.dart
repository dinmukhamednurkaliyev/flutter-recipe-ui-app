// ignore_for_file: prefer_single_quotes

import 'package:flutter/material.dart';
import 'package:flutter_recipe_ui_app/models/recipe.dart';
import 'package:flutter_recipe_ui_app/models/recipe_category.dart';
import 'package:flutter_recipe_ui_app/pages/items_details_page.dart';
import 'package:flutter_recipe_ui_app/theme/colors/colors.dart';
import 'package:flutter_recipe_ui_app/widgets/header_parts.dart';
import 'package:flutter_recipe_ui_app/widgets/search_field.dart';
import 'package:flutter_recipe_ui_app/widgets/section_title.dart';
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
  int selectedPage = 0;
  List<IconData> icons = [
    Iconsax.home1,
    Icons.bar_chart_rounded,
    Iconsax.heart,
    Icons.person_outline_rounded,
  ];
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
            const SectionTitle(title: 'Popular Menu'),
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
                      onTap: () {
                        Navigator.push<dynamic>(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => ItemsDetailsPage(recipeItems: recipe),
                          ),
                        );
                      },
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: recipe.fav ? Colors.red : Colors.black45,
                              ),
                              child: const Icon(
                                Iconsax.heart,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black45,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          recipe.name,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            height: 0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amberAccent,
                                          ),
                                          Text(
                                            '${recipe.rate}',
                                            style: const TextStyle(
                                              height: 0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '1 Bowl (${recipe.weight}g)',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '${recipe.calorie} Kkal | 25% AKL',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 10),
            const SectionTitle(title: 'Categories'),
            categoryItems(),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://www.shutterstock.com/image-photo/young-beautiful-asian-woman-chef-600nw-2317761803.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hona Ci Minh',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Expert Chef",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.1),
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
      bottomSheet: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            icons.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {});
                selectedPage = index;
              },
              child: SizedBox(
                height: 40,
                width: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      icons[index],
                      color: index == selectedPage ? Colors.green : Colors.grey,
                      size: 28,
                    ),
                    if (index == selectedPage)
                      Container(
                        height: 3,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                      )
                    else
                      const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView categoryItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recipeCategory.length,
          (index) => Padding(
            padding:
                index == 0
                    ? const EdgeInsets.only(left: 20, right: 20)
                    : const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 33,
                  backgroundColor: recipeCategory[index].color,
                  child: Image.asset(
                    recipeCategory[index].image,
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  recipeCategory[index].name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
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
