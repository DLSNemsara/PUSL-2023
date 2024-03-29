import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/food.dart';
import 'package:flutter_application_1/widgets/food_card.dart';
import 'package:flutter_application_1/widgets/quick_screen_appbar.dart';
import 'package:iconsax/iconsax.dart';

class QuickFoodsScreen extends StatefulWidget {
  const QuickFoodsScreen({super.key});

  @override
  State<QuickFoodsScreen> createState() => _QuickFoodsScreenState();
}

class _QuickFoodsScreenState extends State<QuickFoodsScreen> {
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
                const QuickScreenAppbar(),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) => FoodCard(
                    food: foods[index],
                  ),
                  itemCount: foods.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
