import 'dart:convert';
// import 'package:food_recipe/models/recipe.dart';
import 'package:http/http.dart' as http;
import 'recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe({int limit = 150}) async {
    List<Recipe> recipes = [];

    int start = 0;
    while (recipes.length < limit) {
      var uri = Uri.https(
        'yummly2.p.rapidapi.com',
        '/feeds/list',
        {"limit": "150", "start": "$start", "tag": "list.recipe.popular"},
      );

      final response = await http.get(uri, headers: {
        "X-RapidAPI-Key":
            "a2dd65e4f0mshe063a85e1567056p11665ejsn1992cd50253f",
        "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
        "useQueryString": "true"
      });

      Map data = jsonDecode(response.body);
      List _temp = [];

      for (var i in data['feed']) {
        _temp.add(i['content']['details']);
      }

      List<Recipe> pageRecipes = Recipe.recipesFromSnapshot(_temp);
      if (pageRecipes.isEmpty) {
        // No more recipes available
        break;
      }

      recipes.addAll(pageRecipes);

      // Increment start for next page
      start += 50;
    }

    // Ensure only the required number of recipes is returned
    return recipes.take(limit).toList();
  }
}
