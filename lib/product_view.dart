import 'package:flutter/material.dart';
import 'package:website1/model.dart';
import 'package:website1/network.dart';
import 'package:website1/recipe_detail_page.dart';
import 'package:website1/favorites_page.dart';

class ProductView extends StatefulWidget {
  final String title;
  final List<Recipe>? recipes; // If provided, use these recipes; else fetch all

  const ProductView({
    super.key,
    this.title = "Recipes",
    this.recipes,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final Network net = Network();
  List<Recipe> allRecipes = [];
  List<Recipe> filteredRecipes = [];
  List<Recipe> favoriteRecipes = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.recipes != null) {
      allRecipes = widget.recipes!;
      filteredRecipes = widget.recipes!;
    } else {
      fetchRecipes();
    }
  }

  void fetchRecipes() async {
    final model = await net.getRecipies();
    setState(() {
      allRecipes = model.recipes;
      filteredRecipes = model.recipes;
    });
  }

  void toggleFavorite(Recipe recipe) {
    setState(() {
      if (favoriteRecipes.contains(recipe)) {
        favoriteRecipes.remove(recipe);
      } else {
        favoriteRecipes.add(recipe);
      }
    });
  }

  void searchRecipes(String query) {
    final results = allRecipes.where((r) =>
    r.name.toLowerCase().contains(query.toLowerCase()) ||
        r.cuisine.toLowerCase().contains(query.toLowerCase()));
    setState(() {
      filteredRecipes = results.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Navigator.canPop(context)
            ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        )
            : null,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      FavoritesPage(favoriteRecipes: favoriteRecipes),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: searchController,
              onChanged: searchRecipes,
              decoration: InputDecoration(
                hintText: "Search recipes...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredRecipes.isEmpty
                ? const Center(child: Text("No recipes found"))
                : ListView.builder(
              itemCount: filteredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = filteredRecipes[index];
                final isFavorite = favoriteRecipes.contains(recipe);
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        recipe.image,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(recipe.name),
                    subtitle: Text(
                        '${recipe.cuisine} • ${recipe.mealType.join(", ")}'),
                    trailing: IconButton(
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isFavorite ? Colors.red : null,
                      ),
                      onPressed: () => toggleFavorite(recipe),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              RecipeDetailPage(recipe: recipe),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
