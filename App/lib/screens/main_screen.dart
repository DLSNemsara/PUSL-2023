import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/screens/browse.dart';
import 'package:flutter_application_2/screens/community_screen.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/screens/profile_screen.dart';
import 'package:iconsax/iconsax.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNavItem(Iconsax.home_1, "Home", 0),
            buildNavItem(Iconsax.search_normal, "Browse", 1),
            buildNavItem(Iconsax.people, "Community", 2),
            buildNavItem(Iconsax.profile_circle, "Profile", 3),
          ],
        ),
      ),
      body: _buildCurrentScreen(),
    );
  }

  Widget buildNavItem(IconData iconData, String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentTab = index;
        });
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/browse');
            break;
          case 2:
            Navigator.pushNamed(context, '/community');
            break;
          case 3:
            Navigator.pushNamed(context, '/profile');
            break;
          default:
            break;
        }
      },
      child: Column(
        children: [
          Icon(
            iconData,
            color: currentTab == index ? kprimaryColor : Colors.grey,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: currentTab == index ? kprimaryColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentScreen() {
    switch (currentTab) {
      case 0:
        return HomeScreen();
      case 1:
        return BrowseScreen();
      case 2:
        return CommunityPage();
      case 3:
        return ProfilePage();
      default:
        return  HomeScreen(); // Default case, you can return a default screen or empty container
    }
  }
}
