import 'package:flutter/material.dart';
import '../../ui/widgets/meal_item.dart';
import '../../model/meal.dart';

class CategoryMealsPage extends StatefulWidget {
  final String routeTitle;
  final String routeId;

  final List<Meal> availableMeals;

  CategoryMealsPage({this.routeId, this.routeTitle, this.availableMeals});

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    //...
    if (!_loadedInitData)
      displayedMeals = widget.availableMeals
          .where(
            (meal) => meal.categories.contains(widget.routeId),
          )
          .toList();
    _loadedInitData = true;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDepenedcies 호출!!');
    super.didChangeDependencies();
  }

  void _removedMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.routeTitle,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            removedItem: _removedMeal,
          ),
          itemCount: displayedMeals.length,
        ));
  }
}
