import 'package:flutter/material.dart';
import 'package:forth_shop_app/ui/pages/products_overview_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyShop',
          style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    Icons.add_shopping_cart,
                  ),
                  onTap: () => print('clicked!!'),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.more_vert,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: ProductsOverViewPage(),
      drawer: Drawer(
        child: Text('Test Hamberger Menu'),
      ),
    );
  }
}
