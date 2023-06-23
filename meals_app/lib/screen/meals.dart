import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite,
  });

  //Category title
  final String? title;
  //List of meals of this category
  final List<Meal> meals;

  //onToggle
  final void Function(Meal meal) onToggleFavorite;

  //seletedMEal to see more details about it
  void selectedMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //widget content
    //Initial widget
    Widget content = Center(
      //Empty List
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('No meals found!'),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting another category ...',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );

    //If meals List containes elements
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        //Rendring Meal Item while passing each meal by index and onselected Meal
        //ItemBuilder
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectedMeal: (meal) {
            selectedMeal(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        //Category Title
        title: Text(title!),
      ),
      //our content Widget
      body: content,
    );
  }
}
