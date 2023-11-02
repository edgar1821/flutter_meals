import 'package:flutter/material.dart';
import 'package:meals/models/Category.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/Category_grid_item.dart';

class CathegoriesScreen extends StatelessWidget {
  const CathegoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your cathegory'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category)
        ],
      ),
    );
  }
}