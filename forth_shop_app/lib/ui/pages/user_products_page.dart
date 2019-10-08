import 'package:flutter/material.dart';
import 'package:forth_shop_app/routers/route.dart';
import 'package:forth_shop_app/ui/widgets/my_shop_drawer.dart';
import 'package:forth_shop_app/ui/widgets/user_product_item.dart';
import '../../providers/product_provider.dart';
import 'package:provider/provider.dart';

class UserProductsPage extends StatelessWidget {
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        .fetchAndSetProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.of(context).pushNamed(
              Router.editProductsPage,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _refreshProducts(context),
                    child: Consumer<Products>(
                      builder: (context, productsData, _) => Padding(
                        padding: EdgeInsets.all(8),
                        child: ListView.builder(
                          itemCount: productsData.items.length,
                          itemBuilder: (_, index) => Column(
                            children: <Widget>[
                              UserProductItem(
                                id: productsData.items[index].id,
                                imageUrl: productsData.items[index].imageUrl,
                                title: productsData.items[index].title,
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
      drawer: MyShopDrawer(),
    );
  }
}
