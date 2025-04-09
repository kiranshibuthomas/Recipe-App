import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class Network {
  Future<RecipieModel> getRecipies() async {
    final uri = Uri.parse("https://dummyjson.com/recipes");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return RecipieModel.fromJson(jsonData);
    } else {
      throw Exception("Failed to load recipes: ${response.statusCode}");
    }
  }
}
