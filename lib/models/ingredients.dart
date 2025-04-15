import 'package:flutter/material.dart';

/// A class representing an ingredient with a name, image, and color.
class Ingredients {
  /// Constructor for the Ingredients class.
  Ingredients({required this.color, required this.name, required this.image});

  /// The name of the ingredient.
  final String name;

  /// The image path of the ingredient.
  final String image;

  /// The color associated with the ingredient.
  final Color color;
}

/// A list of ingredients with their respective names, images, and colors.
List<Ingredients> ingredients = [
  Ingredients(
    color: const Color(0xfff4cfcc),
    name: 'Potato',
    image: 'assets/images/potato.png',
  ),
  Ingredients(
    color: const Color(0xffb8efd0),
    name: 'onion',
    image: 'assets/images/onion.png',
  ),
  Ingredients(
    color: const Color(0xffffe9b2),
    name: 'Almond',
    image: 'assets/images/almond.png',
  ),
  Ingredients(
    color: const Color(0xffddd0a4),
    name: 'Broccoli',
    image: 'assets/images/broccoli.png',
  ),
  Ingredients(
    color: const Color(0xffd8d8d8),
    name: 'Ginger',
    image: 'assets/images/ginger.png',
  ),
];
