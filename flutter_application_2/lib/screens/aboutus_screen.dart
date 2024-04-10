import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AboutUsPage(),
  ));
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Our App!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'We are delighted to have you here. Our app is designed to provide you with an exceptional experience, tailored to meet your needs.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Our Mission:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Our mission is to innovate and create products that enhance the lives of our users. We are committed to making a positive impact on the world through technology.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Meet Our Team',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView(
                children: [
                  buildDeveloperCard('Maheeshi Fonseka'),
                  buildDeveloperCard('Ravindu Siriwardhana'),
                  buildDeveloperCard('Sinel Nemsara'),
                  buildDeveloperCard('Yohan Nanayakkara'),
                  buildDeveloperCard('Eshan Gamage'),
                  buildDeveloperCard('Thejan Rajpaksha'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDeveloperCard(String name) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Developer'),
        onTap: () {
          // Add functionality if needed
        },
      ),
    );
  }
}
