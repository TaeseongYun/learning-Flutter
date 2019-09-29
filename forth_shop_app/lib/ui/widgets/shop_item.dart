import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../routers/route.dart';
import '../../providers/product.dart';
import '../../providers/cart.dart';

class ShopItem extends StatelessWidget {
  // final String id;
  // final String imageUrl;
  // final String itemTitle;

  // ShopItem({this.id, this.imageUrl, this.itemTitle});
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
            Router.detailItemPage,
            arguments: product.id,
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (context, product, child) => IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () => product.toggleFavoriteButton(),
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () => cart.addItem(
              product.id,
              product.price,
              product.title,
            ),
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
