import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/products_provider.dart';
import 'package:shop/util/screen_size_config.dart';
import 'package:shop/widget/product_item_widget.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: ScreenSizeConfig.blockSizeHorizontal * 3,
        mainAxisSpacing: ScreenSizeConfig.blockSizeVertical * 3,
      ),
      itemBuilder: (context, index) =>
          //     ChangeNotifierProvider<SingleProductProvider>(
          //   create: (context) => productsProviderData[index],
          //   child: ProductItemWidget(
          //       // productsProviderData[index].id,
          //       // productsProviderData[index].title,
          //       // productsProviderData[index].imageUrl,
          //       ),
          // ),
          ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItemWidget(),
      ),
      itemCount: products.length,
      padding: EdgeInsets.fromLTRB(
        ScreenSizeConfig.blockSizeHorizontal * 3,
        ScreenSizeConfig.blockSizeHorizontal * 3,
        ScreenSizeConfig.blockSizeHorizontal * 3,
        ScreenSizeConfig.blockSizeHorizontal * 3,
      ),
    );
  }
}
