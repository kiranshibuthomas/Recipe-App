import 'package:flutter/material.dart';
import 'model.dart';
import 'recipe_detail_page.dart';

class FavoritesPage extends StatelessWidget {
  final List<Recipe> favoriteRecipes;

  const FavoritesPage({super.key, required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Recipes'),
      ),
      body: favoriteRecipes.isEmpty
          ? const Center(child: Text('No favorites yet!'))
          : ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          final recipe = favoriteRecipes[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  recipe.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(recipe.name),
              subtitle: Text('${recipe.cuisine} • ${recipe.difficulty.name}'),
              trailing: const Icon(Icons.favorite, color: Colors.red),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(recipe: recipe),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
