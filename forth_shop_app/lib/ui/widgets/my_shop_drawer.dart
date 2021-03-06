import 'package:flutter/material.dart';
import 'package:forth_shop_app/providers/login_provider.dart';
import 'package:provider/provider.dart';
import '../../routers/route.dart';

class MyShopDrawer extends StatelessWidget {
  Widget _buildListTile(String title, IconData icons, Function tapHandler) {
    return ListTile(
      title: Text(title),
      leading: Icon(icons),
      onTap: tapHandler,
    );
  }

  void _selectListTile(BuildContext context, String url) {
    Navigator.of(context).pushReplacementNamed(url);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          _buildListTile(
            'Shop',
            Icons.shop,
            () => _selectListTile(context, Router.homePage),
          ),
          Divider(),
          _buildListTile(
            'Order',
            Icons.shopping_cart,
            () => _selectListTile(context, Router.ordersPage),
          ),
          Divider(),
          _buildListTile(
            'Manage Products',
            Icons.edit,
            () => _selectListTile(context, Router.userProductPage),
          ),
          Divider(),
          _buildListTile('Log-Out', Icons.exit_to_app, () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/');
            Provider.of<LoginProvider>(context).logout();
          })
        ],
      ),
    );
  }
}
