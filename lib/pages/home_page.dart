import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipe_app/pages/detail_page.dart';
import 'package:recipe_app/utils/colors.dart';

import '../models/categories_model.dart';
import '../models/recipe_model.dart';
import '../widgets/header_part.dart';
import '../widgets/my_search_field.dart';

class HomePage extends StatefulWidget {
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
            const HeaderPart(),
            const SizedBox(height: 30),
            const MySearchField(),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Menu",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: textGreen,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            popularMenuItem(),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  recipeItems.length,
                  (index) {
                    final recipe = recipeItems[index];
                    return Padding(
                      padding: index == 0
                          ? const EdgeInsets.only(left: 20, right: 10)
                          : const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailPage(recipeItems: recipe),
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
                                  color:
                                      recipe.fav ? Colors.red : Colors.black54,
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
                                              size: 18,
                                            ),
                                            const SizedBox(width: 1),
                                            Text(
                                              "${recipe.rate}",
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
                                      "1 Bowl (${recipe.weight}g)",
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                        height: 0,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      "${recipe.calorie} KKal | 25% AKL",
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
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: textGreen,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            categoriesItems(),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/people/istockphoto-1318858332-612x612.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Horia Danara",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Expert Chief",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.5),
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
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            icons.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedPage = index;
                });
              },
              child: SizedBox(
                height: 40,
                width: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      icons[index],
                      color: index == selectedPage ? Colors.green : Colors.grey,
                      size: 28,
                    ),
                    index == selectedPage
                        ? Container(
                            height: 3,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView categoriesItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(recipeCategories.length, (index) {
          final recipeCate = recipeCategories[index];
          return Padding(
            padding: index == 0
                ? const EdgeInsets.only(left: 20, right: 20)
                : const EdgeInsets.only(right: 10),
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

  SingleChildScrollView popularMenuItem() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          menuItems.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
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
                      selectedIndex == index ? Colors.green : Colors.white,
                      selectedIndex == index
                          ? Colors.greenAccent
                          : Colors.white,
                    ],
                  ),
                ),
                child: Text(
                  menuItems[index],
                  style: TextStyle(
                    fontSize: 16,
                    color: selectedIndex == index ? Colors.white : Colors.black,
                    fontWeight: selectedIndex == index
                        ? FontWeight.w600
                        : FontWeight.normal,
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
