import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/cart_provider.dart';
import 'package:shop/screen/cart_screen.dart';
import 'package:shop/util/screen_size_config.dart';
import 'package:shop/widget/app_drawer.dart';
import 'package:shop/widget/badge.dart';
import 'package:shop/widget/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  //CONSIST OF PRODUCT ITEM WIDGET AS A BUILDING BLOCK

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context);
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('MyShop'),
    //   ),
    //   body: GridView.builder(
    //     padding: EdgeInsets.fromLTRB(
    //         ScreenSizeConfig.blockSizeHorizontal * 3,
    //         ScreenSizeConfig.blockSizeVertical * 3,
    //         ScreenSizeConfig.blockSizeHorizontal * 3,
    //         ScreenSizeConfig.blockSizeHorizontal * 3),
    //     itemCount: loadedProducts.length,
    //     itemBuilder: (ctx, i) => ProductItemWidget(
    //       loadedProducts[i].id,
    //       loadedProducts[i].title,
    //       loadedProducts[i].imageUrl,
    //     ),
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       childAspectRatio: 3 / 2,
    //       crossAxisSpacing: ScreenSizeConfig.blockSizeHorizontal * 3,
    //       mainAxisSpacing: ScreenSizeConfig.blockSizeVertical * 3,
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Consumer<CartProvider>(
            builder: (BuildContext context, value, Widget child) => Badge(
              child: child,
              value: value.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () =>
                  Navigator.of(context).pushNamed(CartScreen.routeName),
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
        title: Text(
          "My Shop",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
