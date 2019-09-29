import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_category_list_app/model/dummy_data.dart';
import 'package:third_category_list_app/providers/meals_providers.dart';
import '../../ui/widgets/meal_item.dart';

class CategoryMealsPage extends StatefulWidget {
  // final List<Meal> availableMeals;

  // CategoryMealsPage({this.availableMeals});

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle;
  String categoryId;
  var displayedMeals;
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

  @override
  Widget build(BuildContext context) {
    displayedMeals = Provider.of<MealsProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => MealItem(
            id: displayedMeals.listMeals[index].id,
            title: displayedMeals.listMeals[index].title,
            imageUrl: displayedMeals.listMeals[index].imageUrl,
            affordability: displayedMeals.listMeals[index].affordability,
            complexity: displayedMeals.listMeals[index].complexity,
            duration: displayedMeals.listMeals[index].duration,
          ),
          itemCount: displayedMeals.listMeals.length,
        ));
  }
}
