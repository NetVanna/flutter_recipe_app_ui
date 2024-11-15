import 'package:flutter/material.dart';

class Category {
  final String name, image;
  final Color color;

  Category({
    required this.name,
    required this.image,
    required this.color,
  });
}

List<Category> recipeCategories = [
  Category(
    name: "Oats",
    image: "assets/images/oats.png",
    color: const Color(0xffd8d8d8),
  ),
  Category(
    name: "almond",
    image: "assets/images/almond.png",
    color: const Color(0xffd8d8d8),
  ),
  Category(
    name: "banana",
    image: "assets/images/banana.png",
    color: const Color(0xffd8d8d8),
  ),
  Category(
    name: "bread",
    image: "assets/images/bread.png",
    color: const Color(0xffd8d8d8),
  ),
  Category(
    name: "broccoli",
    image: "assets/images/broccoli.png",
    color: const Color(0xffd8d8d8),
  ),
  Category(
    name: "corn",
    image: "assets/images/corn.png",
    color: const Color(0xffd8d8d8),
  ),
];
