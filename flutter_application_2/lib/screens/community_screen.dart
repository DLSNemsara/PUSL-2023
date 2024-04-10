import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_2/screens/firebase_options.dart';

void main() async {
  
  runApp(MaterialApp(
    home: CommunityPage(),
  ));
}

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final textController = TextEditingController();
  final imageUrlController = TextEditingController();
  final linkController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Page'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('post').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              return ListView(
                children: snapshot.data?.docs.map((DocumentSnapshot document) {
                      return Card(
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (document['imageUrl'] != null)
                                Image.network(
                                  document['imageUrl'],
                                  width: 600,
                                  height: 350,
                                ),
                              Text(document['text']),
                              if (document['link'] != null)
                                TextButton(
                                  onPressed: () {
                                    // Add action for the link
                                  },
                                  child: Text(document['link']),
                                ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.thumb_up),
                                    onPressed: () {
                                      document.reference.update(
                                          {'likes': FieldValue.increment(1)});
                                    },
                                  ),
                                  Text('${document['likes']}'),
                                  IconButton(
                                    icon: Icon(Icons.thumb_down),
                                    onPressed: () {
                                      document.reference.update(
                                          {'likes': FieldValue.increment(-1)});
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Delete Post'),
                                            content: Text(
                                                'Are you sure you want to delete this post?'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: Text('Delete'),
                                                onPressed: () async {
                                                  await document.reference
                                                      .delete();
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList() ??
                    [],
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('New Post'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: textController,
                      decoration: InputDecoration(hintText: "Enter text"),
                    ),
                    TextField(
                      controller: imageUrlController,
                      decoration: InputDecoration(hintText: "Enter image URL"),
                    ),
                    TextField(
                      controller: linkController,
                      decoration: InputDecoration(hintText: "Enter link"),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Post'),
                    onPressed: () async {
                      String text = textController.text;
                      String imageUrl = imageUrlController.text;
                      String link = linkController.text;

                      await firestore.collection('post').add({
                        'imageUrl': imageUrl,
                        'text': text,
                        'link': link,
                        'likes': 0,
                      });

                      textController.clear();
                      imageUrlController.clear();
                      linkController.clear();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
