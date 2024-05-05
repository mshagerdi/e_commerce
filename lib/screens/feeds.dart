import 'package:e_commerce/consts/constants.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/provider/product_data_provider.dart';
import 'package:e_commerce/widget/feeds_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/feeds_screen';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductDataProvider>(context);
    // provider.setSelectedCategory(categories.length - 1);
    List<Product> _products = provider.products;
    print('products length: ${_products.length}');
    return Scaffold(
      body: SafeArea(
        child:
            // StaggeredGrid.count(
            //   crossAxisCount: 2,
            //   crossAxisSpacing: 6,
            //   mainAxisSpacing: 8,
            //   children: List.generate(
            //     100,
            //     (index) => FeedProducts(),
            //   ),
            // ),

            GridView.count(
          childAspectRatio: 230 / 392,
          crossAxisCount: 2,
          children: List.generate(
            _products.length,
            (index) => FeedProducts(
              product: _products[index],
            ),
          ),
        ),
      ),
    );
  }
}
