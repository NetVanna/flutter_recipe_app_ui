List<String> menuItems = [
  'Breakfast',
  'Lunch',
  'Dinner',
  'Snack',
  'Cheat Menu',
];

class RecipeItems {
  final String image, name, woner, wonerName, reviews;
  final int carb;
  final double rate;
  final int calorie, fat, protein, weight;
  final bool fav;

  RecipeItems({
    required this.image,
    required this.name,
    required this.woner,
    required this.wonerName,
    required this.reviews,
    required this.carb,
    required this.rate,
    required this.calorie,
    required this.fat,
    required this.protein,
    required this.weight,
    required this.fav,
  });
}

List<RecipeItems> recipeItems = [
  RecipeItems(
    image: "assets/images/thai salad.png",
    name: "Natasa Rock",
    woner: "assets/images/1594668408164.jpg",
    wonerName: "Dara Chann",
    reviews: "24",
    carb: 30,
    rate: 4,
    calorie: 320,
    fat: 16,
    protein: 12,
    weight: 300,
    fav: true,
  ),
  RecipeItems(
    image: "assets/images/Shrimp Kale.png",
    name: "Natasa Rock",
    woner: "assets/images/1594668408164.jpg",
    wonerName: "Dara Chann",
    reviews: "24",
    carb: 30,
    rate: 4,
    calorie: 320,
    fat: 16,
    protein: 12,
    weight: 300,
    fav: false,
  ),
  RecipeItems(
    image: "assets/images/sald-mix.png",
    name: "Natasa Rock",
    woner: "assets/images/1594668408164.jpg",
    wonerName: "Dara Chann",
    reviews: "24",
    carb: 30,
    rate: 4,
    calorie: 320,
    fat: 16,
    protein: 12,
    weight: 300,
    fav: true,
  ),
];
