import 'package:flutter/material.dart';
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
import './ui/pages/splash_screnn.dart';

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
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<LoginProvider, Products>(
          builder: (_, auth, previousProducts) => Products(
            previousProducts == null ? [] : previousProducts.items,
            auth.token,
            auth.userId,
          ),
        ),
        ChangeNotifierProxyProvider<LoginProvider, Orders>(
          builder: (_, auth, previousProducts) => Orders(
            previousProducts == null ? [] : previousProducts.orders,
            authToken: auth.token,
            userId: auth.userId,
          ),
        )
      ],
      child: Consumer<LoginProvider>(
        builder: (context, authData, _) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato'),
          home: authData.isAuth
              ? HomePage()
              : FutureBuilder(
                  future: authData.tryAutoLogin(),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? SplashPages()
                          : UserLogin(),
                ),
          routes: {
            // Router.homePage: (context) => HomePage(),
            Router.detailItemPage: (context) => ProductDetailPage(),
            Router.listCartPage: (context) => ProductCartListPageState(),
            Router.ordersPage: (context) => OrdersPage(),
            Router.userProductPage: (context) => UserProductsPage(),
            Router.editProductsPage: (context) => EditProductsPage(),
          },
        ),
      ),
    );
  }
}
