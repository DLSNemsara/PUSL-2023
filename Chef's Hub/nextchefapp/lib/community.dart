import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nextchefapp/loginApp.dart'; // Assuming MyAppslogin is defined here

class CommunityPage extends StatelessWidget {
  final Future<User?> user = FirebaseAuth.instance.authStateChanges().first;
  final TextEditingController messageController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _deleteMessage(BuildContext context, String messageId) async {
    await firestore.collection('messages').doc(messageId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: user,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.data != null) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Community Page'),
              ),
              body: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: firestore.collection('messages').snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return Center(child: Text('No messages yet.'));
                          }
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              var message = snapshot.data!.docs[index];
                              String text = message['text'];
                              DateTime timestamp =
                                  message['timestamp'].toDate();
                              return ListTile(
                                title: Text(text),
                                subtitle: Text(timestamp.toString()),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    _deleteMessage(context, message.id);
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: messageController,
                            decoration: InputDecoration(
                              hintText: 'Enter your message',
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          //his is the icon
                          label: Text(' '),
                          icon: Icon(Icons.send_rounded), // T
                          onPressed: () async {
                            if (messageController.text.trim().isNotEmpty) {
                              await firestore.collection('messages').add({
                                'text': messageController.text,
                                'timestamp': DateTime.now(),
                              });
                              messageController.clear();
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Empty Message'),
                                  content: Text('Please enter a message.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          } else {
            return MyAppslogin(); // Show login screen when user is not authenticated
          }
        }
      },
    );
  }
}
