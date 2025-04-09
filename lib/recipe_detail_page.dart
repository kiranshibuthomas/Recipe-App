import 'package:flutter/material.dart';
import 'model.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe.image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Cuisine: ${recipe.cuisine}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Difficulty: ${recipe.difficulty.name}',
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Prep Time: ${recipe.prepTimeMinutes} min | Cook Time: ${recipe.cookTimeMinutes} min',
                  ),
                  const Divider(height: 30),
                  Text(
                    'Ingredients',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  ...recipe.ingredients.map((e) => Text('- $e')),
                  const Divider(height: 30),
                  Text(
                    'Instructions',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  ...recipe.instructions.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('• $e'),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
