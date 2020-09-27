import 'package:flutter/material.dart';
import 'package:shop/util/DUMMY_DATA.dart';
import 'package:shop/util/screen_size_config.dart';
import 'package:shop/widget/product_item_widget.dart';

class ProductsOverviewScreen extends StatelessWidget {
  //CONSIST OF PRODUCT ITEM WIDGET AS A BUILDING BLOCK

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
        title: Text(
          "My Shop",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: ScreenSizeConfig.blockSizeHorizontal * 3,
          mainAxisSpacing: ScreenSizeConfig.blockSizeVertical * 3,
        ),
        itemBuilder: (context, index) => ProductItemWidget(
          loadedProducts[index].id,
          loadedProducts[index].title,
          loadedProducts[index].imageUrl,
        ),
        itemCount: loadedProducts.length,
        padding: EdgeInsets.fromLTRB(
          ScreenSizeConfig.blockSizeHorizontal * 3,
          ScreenSizeConfig.blockSizeHorizontal * 3,
          ScreenSizeConfig.blockSizeHorizontal * 3,
          ScreenSizeConfig.blockSizeHorizontal * 3,
        ),
      ),
    );
  }
}
