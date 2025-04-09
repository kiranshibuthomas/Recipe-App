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
  final List<String> categories = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Snack',
    'Dessert',
    'Side Dish',
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
      appBar: AppBar(
        title: const Text('Recipe Categories'),
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
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
          children: categories.map((category) {
            return GestureDetector(
              onTap: () => navigateToCategory(category),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    category,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
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