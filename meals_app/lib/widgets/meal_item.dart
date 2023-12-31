import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectedMeal,
  });

  final Meal meal;
  final void Function(Meal meal) onSelectedMeal;

  //to upperCase the first letter of the complexity
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  //to upperCase the first letter of the affordability
  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        //it took us to => Meal Details
        onTap: () {
          onSelectedMeal(meal);
        },
        child: Stack(
          children: [
            //Meal Img
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    //Meal Title
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //Using meal item trait to avoid writing each time the size of icon and text ...
                      children: [
                        //Duration
                        MealItemTrait(
                          icon: Icons.schedule_rounded,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        //Complexity
                        MealItemTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        //Afoordability
                        MealItemTrait(
                          icon: Icons.attach_money_outlined,
                          label: affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
