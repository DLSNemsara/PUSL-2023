import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/home_appbar.dart';
import 'package:flutter_application_2/widgets/home_search_bar.dart';
//import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentCat = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppbar(),
                const SizedBox(height: 20),
                const HomeSearchBar(),
                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 233, 232, 232),
                    borderRadius:
                        BorderRadius.circular(15), // Set the border radius here
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(
                                14.0), // This is where you set the padding
                            child: Text(
                              'Local, Customized Meal Planning',
                              style: TextStyle(
                                color: Color.fromARGB(255, 24, 131, 24),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(
                              12.0), // This is where you set the padding
                          child: Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/Chef_Cooking.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Second Card
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 233, 232, 232),
                    borderRadius:
                        BorderRadius.circular(15), // Set the border radius here
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(
                              12.0), // This is where you set the padding
                          child: Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/Food1.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            child: Padding(
                          padding: const EdgeInsets.all(
                              14.0), // This is where you set the padding
                          child: Text(
                            'Gourmet Quality Hassle-Free',
                            style: TextStyle(
                              color: Color.fromARGB(255, 24, 131, 24),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Third Card
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 233, 232, 232),
                    borderRadius:
                        BorderRadius.circular(15), // Set the border radius here
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            child: Padding(
                          padding: const EdgeInsets.all(
                              14.0), // This is where you set the padding
                          child: Text(
                            'Delicious And Nutritious Fresh Meals',
                            style: TextStyle(
                              color: Color.fromARGB(255, 24, 131, 24),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        )),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(
                              12.0), // This is where you set the padding
                          child: Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.scaleDown,
                                image: AssetImage("assets/Customers_Enjoy_Food.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
