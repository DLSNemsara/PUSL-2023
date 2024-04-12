import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nextchefapp/community.dart';
import 'package:nextchefapp/search.dart';
import 'package:nextchefapp/setting.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.green,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          selectedLabelStyle: TextStyle(color: Colors.black),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          HomePage(),
          SearchPage(),
          CommunityPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.easeIn);
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            activeIcon: Icon(Icons.home, color: Colors.green),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.grey),
            activeIcon: Icon(Icons.search, color: Colors.green),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group, color: Colors.grey),
            activeIcon: Icon(Icons.group, color: Colors.green),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.grey),
            activeIcon: Icon(Icons.account_circle, color: Colors.green),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
