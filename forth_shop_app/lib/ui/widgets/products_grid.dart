import 'package:flutter/material.dart';
import '../widgets/shop_item.dart';
import '../../providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool isFavorite;

  ProductsGrid({this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);

    final products =
        isFavorite ? productsProvider.favoriteItems : productsProvider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ShopItem(),
      ),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
