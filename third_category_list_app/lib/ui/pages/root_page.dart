import 'package:flutter/material.dart';
import 'package:third_category_list_app/ui/pages/category_main_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Third_Category_List_App',
      home: CategoryMainPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}