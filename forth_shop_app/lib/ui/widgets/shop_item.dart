import 'package:flutter/material.dart';

class ShopItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String itemTitle;

  ShopItem({this.id, this.imageUrl, this.itemTitle});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(Icons.favorite),
            color: Theme.of(context).accentColor,
            onPressed: () => print('click Favorite!'),
          ),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () => print('clicked AddCart'),
          ),
          backgroundColor: Colors.black87,
          title: Text(
            itemTitle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
