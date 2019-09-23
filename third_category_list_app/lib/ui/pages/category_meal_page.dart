import 'package:flutter/material.dart';
import '../../model/dummy_data.dart';
import '../../ui/widgets/meal_item.dart';

class CategoryMealsPage extends StatelessWidget {
  final String routeTitle;
  final String routeId;

  CategoryMealsPage({this.routeId, this.routeTitle});

  @override
  Widget build(BuildContext context) {
    final categoryMeals = DUMMY_MEALS
        .where(
          (meal) => meal.categories.contains(routeId),
        )
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            routeTitle,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => MealItem(
            id:  categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
          ),
          itemCount: categoryMeals.length,
        ));
  }
}
