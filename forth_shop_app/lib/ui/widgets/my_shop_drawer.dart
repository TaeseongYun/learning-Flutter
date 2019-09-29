import 'package:flutter/material.dart';
import '../../routers/route.dart';

class MyShopDrawer extends StatelessWidget {
  Widget _buildListTile(String title, IconData icons, Function tapHandler) {
    return ListTile(
      title: Text(title),
      leading: Icon(icons),
      onTap: tapHandler,
    );
  }

  void _seletListTile(BuildContext context, String url) {
    Navigator.of(context).pushNamed(url);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 120,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              'MyShop',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
                color: Theme.of(context).accentColor,
              ),
            ),
            color: Theme.of(context).primaryColor,
          ),
          _buildListTile('List Cart', Icons.add_shopping_cart,
              () => _seletListTile(context, Router.listCartPage)),
        ],
      ),
    );
  }
}
