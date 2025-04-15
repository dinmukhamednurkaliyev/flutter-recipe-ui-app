import 'package:flutter/material.dart';

/// A class representing a recipe category.
class Category {
  ///
  Category({required this.name, required this.image, required this.color});

  /// The name of the category.
  final String name;

  /// The image of the category.
  final String image;

  /// The color associated with the category.
  final Color color;
}

/// A list of recipe categories.
List<Category> recipeCategory = [
  Category(
    name: 'Oats',
    image: 'assets/images/oats.png',
    color: const Color(0xffd8d8d8),
  ),
  Category(
    name: 'Cereals',
    image: 'assets/images/cereal.png',
    color: const Color(0xfff4cfcc),
  ),
  Category(
    name: 'Fruits',
    image: 'assets/images/banana.png',
    color: const Color(0xffb8efd0),
  ),
  Category(
    name: 'Vegetable',
    image: 'assets/images/corn.png',
    color: const Color(0xffffe9b2),
  ),
  Category(
    name: 'Bread',
    image: 'assets/images/bread.png',
    color: const Color(0xffddd0a4),
  ),
];
