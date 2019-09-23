import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../../model/dummy_data.dart';

class CategoryMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((dummy) => CategoryItem(
                id: dummy.id,
                color: dummy.color,
                title: dummy.title,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
