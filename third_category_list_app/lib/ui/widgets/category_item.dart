import 'package:flutter/material.dart';
import 'package:third_category_list_app/router.dart';
import 'package:third_category_list_app/ui/pages/category_meal_page.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Router.push(
        context,
        Router.categoryMeals,
        {
          'id': id,
          'title': title,
        },
      ),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
