// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/models/recipe.dart';

// class RecipeDetailScreen extends StatelessWidget {
//   final Recipe recipe;

//   const RecipeDetailScreen({Key? key, required this.recipe}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(recipe.name),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Cooking Time: ${recipe.totalTime}'),
//             Text('Ingredients:'),
//             for (var ingredient in recipe.ingredients) Text('- $ingredient'),
//             // Add more recipe detail information here
//           ],
//         ),
//       ),
//     );
//   }
// }
