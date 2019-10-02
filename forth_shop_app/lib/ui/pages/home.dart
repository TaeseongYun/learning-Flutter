import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:forth_shop_app/providers/cart.dart';
import 'package:provider/provider.dart';
import '../widgets/products_grid.dart';
import 'package:forth_shop_app/ui/widgets/my_shop_drawer.dart';
import '../../routers/route.dart';
import '../../providers/product_provider.dart';

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

Future<void> _onRefreshComplete(BuildContext context) async {
  await Provider.of<Products>(context).fetchAndSetProducts();
}

class _HomePageState extends State<HomePage> {
  var _isFavoriteItem = false;
  var _initState = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_initState) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _initState = false;
    super.didChangeDependencies();
  }

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
                            _isFavoriteItem = true;
                          } else {
                            _isFavoriteItem = false;
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
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () => _onRefreshComplete(context),
                child: ProductsGrid(
                  isFavorite: _isFavoriteItem,
                ),
              ),
        drawer: MyShopDrawer());
  }
}
