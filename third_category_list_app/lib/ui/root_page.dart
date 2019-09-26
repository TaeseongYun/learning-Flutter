import 'package:flutter/material.dart';
import 'package:third_category_list_app/model/dummy_data.dart';
import 'package:third_category_list_app/router.dart';
import 'package:third_category_list_app/ui/pages/category_meal_page.dart';
import 'package:third_category_list_app/ui/pages/filters_page.dart';
import 'package:third_category_list_app/ui/pages/tabs_page.dart';
import '../ui/pages/filters_page.dart';
import '../model/meal.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  static List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filters['gluten']) {
          return false;
        }
        if (!meal.isVegan && _filters['vegan']) {
          return false;
        }
        if (!meal.isVegetarian && _filters['vegetarian']) {
          return false;
        }
        if (!meal.isLactoseFree && _filters['lactose']) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      home: TabsPage(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        //라우터 클래스를 만들었지만 home에서 url 인식을 하지 못해 추가해주었음.
        Router.filtersPage: (context) => FilterPage(
              currentFilter: _filters,
              saveFilters: _setFilters,
            ),
      },
    );
  }
}
