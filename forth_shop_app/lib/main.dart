import 'package:flutter/material.dart';
import 'package:forth_shop_app/http/login_api_service.dart';
import 'package:forth_shop_app/providers/login_provider.dart';
import 'package:forth_shop_app/providers/orders.dart';
import 'package:forth_shop_app/ui/pages/edit_products_page.dart';
import 'package:forth_shop_app/ui/pages/home.dart';
import 'package:forth_shop_app/ui/pages/orders_page.dart';
import 'package:forth_shop_app/ui/pages/product_cartlist_page.dart';
import 'package:forth_shop_app/ui/pages/product_detail_page.dart';
import 'package:forth_shop_app/ui/pages/user_login_page.dart';
import 'package:forth_shop_app/ui/pages/user_products_page.dart';
import './routers/route.dart';
import './providers/product_provider.dart';
import 'package:provider/provider.dart';
import './providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: LoginProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
        ChangeNotifierProvider.value(
          value: LoginProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: UserLogin(),
        routes: {
          // Router.homePage: (context) => HomePage(),
          Router.detailItemPage: (context) => ProductDetailPage(),
          Router.listCartPage: (context) => ProductCartListPageState(),
          Router.ordersPage: (context) => OrdersPage(),
          Router.userProductPage: (context) => UserProductsPage(),
          Router.editProductsPage: (context) => EditProductsPage(),
        },
      ),
    );
  }
}
