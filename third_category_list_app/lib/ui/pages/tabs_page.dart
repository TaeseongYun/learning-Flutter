import 'package:flutter/material.dart';
import 'package:third_category_list_app/ui/pages/category_main_page.dart';
import 'package:third_category_list_app/ui/pages/favorites_page.dart';
import 'package:third_category_list_app/ui/widgets/main_drawer.dart';
import '../../model/meal.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsPage({this.favoriteMeals});
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': CategoryMainPage(),
        'title': 'Categories',
      },
      {
        'page': FavoritesPage(
          favoriteMeals: widget.favoriteMeals,
        ),
        'title': 'Favorites',
      }
    ];
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _pages[_selectedPageIndex]['title'],
          ),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => _selectPage(index),
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favorites'),
            )
          ],
        ));
  }
}
