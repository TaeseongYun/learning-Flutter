import 'package:flutter/material.dart';
import 'package:third_category_list_app/ui/pages/filters_page.dart';
import 'package:third_category_list_app/ui/pages/tabs_page.dart';
import './model/meal.dart';
import './ui/pages/meal_detail_page.dart';
import './ui/pages/category_meal_page.dart';

class Router {
  static const categoryMain = '/';
  static const categoryMeals = '/category-meals';
  static const mealDetailPage = '/meal-detail';
  static const filtersPage = '/filters';

//  Widget _router(String url, dynamic params) {
//    String pageId = _pageIdMap[url];
//    return _getPage(pageId, params);
//  }
//
//  Map<String, dynamic> _pageIdMap = <String, dynamic>{
//    'app/': 'ContainerPageWidget',
//    detailPage: 'DetailPage',
//  };

  Widget _getPage(String url, dynamic params, List<Meal> availableMeals) {
    switch (url) {
      case categoryMain:
        return TabsPage();
        break;
      case categoryMeals:
        return CategoryMealsPage(
          routeId: params['id'],
          routeTitle: params['title'],
          availableMeals: availableMeals,
        );
        break;
      case mealDetailPage:
        return MealDetailPage(
          mealId: params['id'],
        );
        break;
      case filtersPage:
        return FilterPage();
        break;
    }
    return null;
  }

//
//  void push(BuildContext context, String url, dynamic params) {
//    Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return _getPage(url, params);
//    }));
//  }

  Router.pushNoParams(
      BuildContext context, String url, List<Meal> availableMeals) {
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => _getPage(url, null, availableMeals)))
        .then((result) => print(result));
  }

  Router.push(BuildContext context, String url, dynamic params,
      Function removeHandler) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => _getPage(url, params, null))).then((result) {
      if (result != null) removeHandler(result);
    });
  }

  Router.pushReplace(
      BuildContext context, String url, List<Meal> availableMeals) {
    Navigator.pushReplacementNamed(context, url,
            arguments: MaterialPageRoute(
                builder: (context) => _getPage(url, null, availableMeals)))
        .then((result) => print(result));
  }

  Router.popPage(BuildContext context, dynamic passData) {
    Navigator.of(context).pop(passData);
  }
}
