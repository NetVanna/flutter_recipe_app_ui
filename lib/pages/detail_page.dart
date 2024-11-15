import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipe_app/models/recipe_model.dart';

import '../utils/colors.dart';
import '../widgets/ingredients.dart';
import '../widgets/clip_path_widget.dart';
import '../widgets/my_progress_indicator_value.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.recipeItems});

  final RecipeItems recipeItems;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            Positioned(
              top: 30,
              left: 20,
              child: CircleAvatar(
                backgroundColor: Colors.black38,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: size.height * 0.5,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundImage:
                                AssetImage(widget.recipeItems.woner),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.recipeItems.wonerName,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    height: 0,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "12 Recipe Shared",
                                  style: TextStyle(
                                    height: 0,
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${widget.recipeItems.rate}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  RatingBar.builder(
                                    itemSize: 15,
                                    initialRating: widget.recipeItems.rate,
                                    unratedColor: Colors.grey.shade400,
                                    itemBuilder: (context, index) {
                                      return const Icon(
                                        Icons.star,
                                        color: Colors.amberAccent,
                                      );
                                    },
                                    onRatingUpdate: (value) {},
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${widget.recipeItems.reviews} Reviews",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.recipeItems.name,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "1 Bowl (${widget.recipeItems.weight}g)",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            "See details",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyProgressIndicatorValue(
                            name: "Carb",
                            amount: "${widget.recipeItems.carb} g ",
                            percentStage: "(56%)",
                            color: Colors.green,
                            data: 0.4,
                          ),
                          MyProgressIndicatorValue(
                            name: "Fat",
                            amount: "${widget.recipeItems.fat} g ",
                            percentStage: "(72%)",
                            color: Colors.red,
                            data: 0.4,
                          ),
                          MyProgressIndicatorValue(
                            name: "Protein",
                            amount: "${widget.recipeItems.protein} g ",
                            percentStage: "(8%)",
                            color: Colors.orange,
                            data: 0.4,
                          ),
                          MyProgressIndicatorValue(
                            name: "Calorie",
                            amount: "${widget.recipeItems.calorie} kcal ",
                            percentStage: "(56%)",
                            color: Colors.green,
                            data: 0.4,
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ingredients",
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
                      const SizedBox(height: 20),
                      const Ingredients(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.5,
              child: ClipPath(
                clipper: ClipPathWidget(),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.48,
              right: 30,
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 5,
                    ),
                  ],
                  color: widget.recipeItems.fav ? Colors.red : Colors.black45,
                ),
                child: const Icon(
                  Iconsax.heart,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
