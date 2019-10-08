import 'package:flutter/material.dart';
import '../widgets/shop_item.dart';
import '../../providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatefulWidget {
  final bool isFavorite;

  ProductsGrid({this.isFavorite});

  @override
  _ProductsGridState createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Opacity> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // _animation = Tween<Opacity>(
    //     begin: Opacity(
    //       opacity: 0,
    //     ),
    //     end: Opacity(
    //       opacity: 1,
    //     )).animate();

    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);

    final products = widget.isFavorite
        ? productsProvider.favoriteItems
        : productsProvider.items;
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
