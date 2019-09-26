import 'package:flutter/material.dart';
import 'package:third_category_list_app/model/dummy_data.dart';
import '../../ui/widgets/meal_item.dart';
import '../../model/meal.dart';

class CategoryMealsPage extends StatefulWidget {
  final List<Meal> availableMeals;

  CategoryMealsPage({this.availableMeals});

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle;
  String categoryId;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    //...

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    categoryId = routeArgs['id'];
    if (!_loadedInitData)
      displayedMeals = DUMMY_MEALS
          .where(
            (meal) => meal.categories.contains(categoryId),
          )
          .toList();
    _loadedInitData = true;
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
            categoryTitle,
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
          ),
          itemCount: displayedMeals.length,
        ));
  }
}
