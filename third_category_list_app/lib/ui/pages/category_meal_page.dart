import 'package:flutter/material.dart';
import 'package:third_category_list_app/model/dummy_data.dart';
import '../../model/meal.dart';

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
          itemBuilder: (context, index) => Text(categoryMeals[index].title),
          itemCount: categoryMeals.length,
        ));
  }
}
