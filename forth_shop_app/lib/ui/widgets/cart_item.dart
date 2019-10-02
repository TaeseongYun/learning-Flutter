import 'package:flutter/material.dart';
import '../../providers/cart.dart';

import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productsId;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    this.quantity,
    this.price,
    this.id,
    this.title,
    this.productsId,
  });

  @override
  Widget build(BuildContext context) {
    // print('productsId is what? => $productsId');
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => Provider.of<Cart>(
        context,
        listen: false,
      ).removeItem(productsId),
      confirmDismiss: (direction) => showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Are you sure?'),
                content: Text('Do you want to remove the item from the cart?'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('No'),
                    onPressed: () => Navigator.of(ctx).pop(false),
                  ),
                  FlatButton(
                    child: Text('Yes'),
                    onPressed: () => Navigator.of(ctx).pop(true),
                  ),
                ],
              )),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text(
                    '\$$price',
                  ),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
