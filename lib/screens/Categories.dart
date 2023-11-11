import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/MealScreen.dart';
import 'package:meals/widgets/Category_grid_item.dart';
import 'package:meals/models/Category.dart';

class CathegoriesScreen extends StatelessWidget {
  const CathegoriesScreen({super.key});

  void _selectcategory(BuildContext context, Category category) {
    final filteredMeal = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: ((ctx) => MealScreen(
              title: 'Some title',
              meals: filteredMeal,
            ))));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectcategory(context, category);
              })
      ],
    );
  }
}
