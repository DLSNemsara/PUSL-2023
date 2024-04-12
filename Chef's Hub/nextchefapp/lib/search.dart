import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nextchefapp/loginApp.dart'; // Assuming MyAppslogin is defined here
import 'package:firebase_auth/firebase_auth.dart';

class RecipeLink {
  final String title;
  final String description;
  final String url;

  RecipeLink({
    required this.title,
    required this.description,
    required this.url,
  });
}

class SearchPage extends StatelessWidget {
  final Future<User?> user = FirebaseAuth.instance.authStateChanges().first;

  final List<RecipeLink> recipeLinks = [
    RecipeLink(
      title: 'Recipe 1',
      description: 'This is the first recipe description.',
      url: 'https://www.example.com/recipe1',
    ),
    RecipeLink(
      title: 'Recipe 2',
      description: 'This is the second recipe description.',
      url: 'https://www.example.com/recipe2',
    ),
    RecipeLink(
      title: 'Recipe 3',
      description: 'This is the third recipe description.',
      url: 'https://www.example.com/recipe3',
    ),
    // Add more recipe links here
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: user,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.data != null) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Search Recipe with Resources'),
              ),
              body: ListView.builder(
                itemCount: recipeLinks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: InkWell(
                      onTap: () async {
                        try {
                          if (await canLaunch(recipeLinks[index].url)) {
                            await launch(recipeLinks[index].url);
                          } else {
                            throw 'Could not launch ${recipeLinks[index].url}';
                          }
                        } catch (e) {
                          print('Error launching URL: $e');
                        }
                      },
                      child: ListTile(
                        title: Text(recipeLinks[index].title),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(recipeLinks[index].description),
                            Text(
                              recipeLinks[index].url,
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
            // Assuming MyAppslogin is a valid widget
          } else {
            return MyAppslogin();
          }
        }
      },
    );
  }
}
