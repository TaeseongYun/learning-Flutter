import 'package:flutter/material.dart';
import 'package:third_category_list_app/ui/pages/category_main_page.dart';
import './ui/pages/category_meal_page.dart';

class Router {
  static const categoryMain = '/';
  static const categoryMeals = '/category-meals';

//  Widget _router(String url, dynamic params) {
//    String pageId = _pageIdMap[url];
//    return _getPage(pageId, params);
//  }
//
//  Map<String, dynamic> _pageIdMap = <String, dynamic>{
//    'app/': 'ContainerPageWidget',
//    detailPage: 'DetailPage',
//  };

  Widget _getPage(String url, dynamic params) {
    switch (url) {
      case categoryMain:
        return CategoryMainPage();
      case categoryMeals:
        return CategoryMealsPage(
          routeId: params['id'],
          routeTitle: params['title'],
        );
    }
    return null;
  }

//
//  void push(BuildContext context, String url, dynamic params) {
//    Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return _getPage(url, params);
//    }));
//  }

  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => _getPage(url, null)));
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => _getPage(url, params)));
  }
}
