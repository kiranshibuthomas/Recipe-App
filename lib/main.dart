import 'package:flutter/material.dart';
import 'package:website1/home_page.dart';
import 'package:website1/product_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4E5D6A), // Modern blue-gray tone
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4E5D6A), // Consistent app bar
          foregroundColor: Colors.white,
        ),
        cardTheme: CardTheme(
          color: const Color(0xFFEAEFF4), // Light background for cards
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
