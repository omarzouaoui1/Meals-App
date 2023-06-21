import 'package:flutter/material.dart';
import 'package:meals_app/data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCaegory(BuildContext context, Category category) {
    //filtring on meals list
    final filteredMeals = dummyMeals
        .where(
          //Rendring meals of that category
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    //Meals Screen while taping on the Category Grid Item
    //Passing category title + List of meals that containes to that category
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
        //Grid View
        GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        //Looping on categories
        for (final category in availableCategories)
          //Passing category and meals of ite
          CategoryGridItem(
            category: category,
            onselectCategory: () {
              _selectCaegory(context, category);
            },
          )
      ],
    );
  }
}
