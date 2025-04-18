import 'package:flutter/material.dart';
import 'package:website1/product_view.dart';
import 'package:website1/model.dart';
import 'package:website1/network.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> categories = [
    {'title': 'Breakfast', 'image': 'assets/images/breakfast.jpg'},
    {'title': 'Lunch', 'image': 'assets/images/lunch.jpg'},
    {'title': 'Dinner', 'image': 'assets/images/dinner.jpg'},
    {'title': 'Snack', 'image': 'assets/images/snack.jpg'},
    {'title': 'Dessert', 'image': 'assets/images/dessert.jpg'},
    {'title': 'Side Dish', 'image': 'assets/images/side_dish.jpg'},
  ];

  RecipieModel? recipeData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadRecipes();
  }

  void loadRecipes() async {
    final data = await Network().getRecipies();
    setState(() {
      recipeData = data;
      isLoading = false;
    });
  }

  void navigateToCategory(String category) {
    final filtered = recipeData!.recipes
        .where((r) => r.mealType.contains(category))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductView(title: category, recipes: filtered),
      ),
    );
  }

  void navigateToAllRecipes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            ProductView(title: 'All Recipes', recipes: recipeData?.recipes),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1), // Light yellow
      appBar: AppBar(
        title: const Text('Recipe Categories'),
        backgroundColor: const Color(0xFFFF7043), // Light orange
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book),
            tooltip: 'View All Recipes',
            onPressed: isLoading ? null : navigateToAllRecipes,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: categories.map((category) {
            return GestureDetector(
              onTap: () => navigateToCategory(category['title']!),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(category['image']!),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.darken,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  category['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
