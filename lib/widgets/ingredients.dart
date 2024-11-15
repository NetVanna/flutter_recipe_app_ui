import 'package:flutter/material.dart';

import '../models/categories_model.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(recipeCategories.length, (index) {
          final recipeCate = recipeCategories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 33,
                  backgroundColor: recipeCate.color,
                  child: Image.asset(
                    recipeCate.image,
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  recipeCate.name,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
