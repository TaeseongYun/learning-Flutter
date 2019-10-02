class Router {
  static const String detailItemPage = '/detailItemPage';
  static const String homePage = '/';
  static const String listCartPage = '/listCartPage';
  static const String ordersPage = '/orders';
  static const String userProductPage = '/userProducts';
  static const String editProductsPage = '/edit-products';

  static const String urlPattern =
      r'(http(s)?|ftp)://([-A-z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:,.;]*)?';
  static const String dateFormat = 'yyyy/MM/dd   HH:mm';

  //firebase URL
  static const String productUrl = 'https://fluttershopapp-29105.firebaseio.com/products.json';
}
