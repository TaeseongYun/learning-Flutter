import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/category_providers.dart';
import '../widgets/category_item.dart';

class CategoryMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listMealsProvider = Provider.of<CategoryProviders>(context);
    return GridView(
      padding: EdgeInsets.all(25),
      children: listMealsProvider.listCategories
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
