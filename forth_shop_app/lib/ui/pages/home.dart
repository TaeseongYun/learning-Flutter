import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:forth_shop_app/providers/cart.dart';
import 'package:provider/provider.dart';
import '../widgets/products_grid.dart';
import 'package:forth_shop_app/ui/widgets/my_shop_drawer.dart';
import '../../routers/route.dart';

enum FilterOptions {
  Favorites,
  All,
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

void _selectedCartPage(BuildContext ctx) {
  Navigator.of(ctx).pushNamed(Router.listCartPage);
}
class _HomePageState extends State<HomePage> {
  var isFavoriteItem = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'MyShop',
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Consumer<Cart>(
                    builder: (_, cart, ch) => GestureDetector(
                      onTap: () => _selectedCartPage(context),
                      child: Badge(
                        animationType: BadgeAnimationType.slide,
                        child: Icon(Icons.shopping_cart),
                        badgeContent: Text(
                          cart.itemCount.toString(),
                        ),
                      ),
                    ),
                  ),
                  PopupMenuButton(
                      icon: Icon(
                        Icons.more_vert,
                      ),
                      onSelected: (FilterOptions selectedValue) {
                        setState(() {
                          if (selectedValue == FilterOptions.Favorites) {
                            isFavoriteItem = true;
                          } else {
                            isFavoriteItem = false;
                          }
                        });
                      },
                      itemBuilder: (_) => [
                            PopupMenuItem(
                              child: Text('Only Favorites'),
                              value: FilterOptions.Favorites,
                            ),
                            PopupMenuItem(
                              child: Text('Show All'),
                              value: FilterOptions.All,
                            ),
                          ])
                ],
              ),
            ),
          ],
        ),
        body: ProductsGrid(
          isFavorite: isFavoriteItem,
        ),
        drawer: MyShopDrawer());
  }
}
