import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Community',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CommunityScreen(),
    );
  }
}

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final CollectionReference postsCollection =
      FirebaseFirestore.instance.collection('posts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Community'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: postsCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final posts = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Post(
              recipe: data['recipe'],
              user: data['user'],
              likes: data['likes'],
              comments: data['comments'],
            );
          }).toList();
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostForm(
                  onSubmit: (String recipe) async {
                    await postsCollection.add({
                      'recipe': recipe,
                      'user': 'CurrentUser',
                      'likes': 0,
                      'comments': 0,
                    });
                  },
                ),
                SizedBox(height: 20),
                ...posts.map((post) {
                  return PostItem(
                    post: post,
                    onTap: () {
                      // Handle tapping on a post
                    },
                    onLike: () {
                      // Handle liking a post
                    },
                    onComment: () {
                      // Handle commenting on a post
                    },
                  );
                }).toList(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Post {
  final String recipe;
  final String user;
  final int likes;
  final int comments;

  Post({
    required this.recipe,
    required this.user,
    required this.likes,
    required this.comments,
  });
}

class PostForm extends StatefulWidget {
  final Function(String) onSubmit;

  const PostForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final TextEditingController _recipeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _recipeController,
            decoration: InputDecoration(
              labelText: 'Share your recipe',
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              widget.onSubmit(_recipeController.text);
              _recipeController.clear();
            },
            child: Text('Post'),
          ),
        ],
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final Post post;
  final VoidCallback? onTap;
  final VoidCallback? onLike;
  final VoidCallback? onComment;

  const PostItem({
    Key? key,
    required this.post,
    this.onTap,
    this.onLike,
    this.onComment,
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
                'Recipe: ${post.recipe}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Posted by: ${post.user}'),
              SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: onLike,
                  ),
                  SizedBox(width: 4),
                  Text('${post.likes}'),
                  SizedBox(width: 16),
                  IconButton(
                    icon: Icon(Icons.comment),
                    onPressed: onComment,
                  ),
                  SizedBox(width: 4),
                  Text('${post.comments}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
