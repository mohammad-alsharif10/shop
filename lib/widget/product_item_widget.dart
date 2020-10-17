import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/cart_provider.dart';
import 'package:shop/provider/single_product_provider.dart';
import 'package:shop/screen/product_detail_screen.dart';

class ProductItemWidget extends StatelessWidget {
  //THE BUILDING BLOCK OF THE PRODUCT OVERVIEW SCREEN

  // final String id;
  // final String title;
  // final String imageUrl;
  //
  // ProductItemWidget(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final SingleProductProvider singleProductProvider =
        Provider.of<SingleProductProvider>(context);
    final cart = Provider.of<CartProvider>(context, listen: false);
    return Consumer<SingleProductProvider>(
      builder: (context, value, child) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: value.id,
              );
            },
            child: Image.network(
              value.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(
                  value.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () => value.toggleFavoriteStatus(),
            ),
            title: Text(
              value.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () => cart.addItem(singleProductProvider.id,
                  singleProductProvider.price, singleProductProvider.title),
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
