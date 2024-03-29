import 'package:e_commerce/widget/feeds_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/feeds';

  @override
  Widget build(BuildContext context) {
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
            100,
            (index) => FeedProducts(),
          ),
        ),
      ),
    );
  }
}
