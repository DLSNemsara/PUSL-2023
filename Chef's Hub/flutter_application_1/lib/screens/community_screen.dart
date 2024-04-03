import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Community'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Widget for posting a new recipe
            // This could be a separate widget like PostRecipeForm()

            // List of posts
            // Each post could be represented by a custom widget like PostItem(),
            // containing information such as the recipe, user who posted it,
            // likes count, comments count, etc.

            // Example post
            PostItem(
              recipe: 'Delicious Pasta Recipe',
              user: 'User123',
              likes: 20,
              comments: 10,
              // onTap: () {}, // Functionality to view post details
            ),

            // Add more PostItem widgets for other posts

            // This is just a basic outline. You would need to implement more
            // complex functionality such as liking, sharing, commenting,
            // managing posts and comments, user authentication, etc.
          ],
        ),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String recipe;
  final String user;
  final int likes;
  final int comments;
  final VoidCallback? onTap;

  const PostItem({
    Key? key,
    required this.recipe,
    required this.user,
    required this.likes,
    required this.comments,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recipe: $recipe',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Posted by: $user'),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.thumb_up),
                  SizedBox(width: 4),
                  Text('$likes'),
                  SizedBox(width: 16),
                  Icon(Icons.comment),
                  SizedBox(width: 4),
                  Text('$comments'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
