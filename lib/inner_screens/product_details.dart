import 'dart:ui';

import 'package:e_commerce/consts/constants.dart';
import 'package:e_commerce/consts/my_icons.dart';
import 'package:e_commerce/consts/styles.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/provider/product_data_provider.dart';
import 'package:e_commerce/screens/cart.dart';
import 'package:e_commerce/screens/wishlist.dart';
import 'package:e_commerce/widget/feeds_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = '/product_details';

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    Product product = arguments['productAttributes'];
    final provider = Provider.of<ProductDataProvider>(context);
    List<Product> _products = provider.products;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('DETAIL'),
        ),
        actions: [
          IconButton(
            icon: Icon(MyAppIcons.wishlist),
            onPressed: () {
              Navigator.of(context).pushNamed(WishlistScreen.routeName);
            },
          ),
          IconButton(
            icon: Icon(MyAppIcons.cart),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .44,
            width: double.infinity,
            child: Image.network(product.imageUrl),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .44 + 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(MyAppIcons.save),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(MyAppIcons.share),
                    ),
                  ],
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18.0,
                      horizontal: 9,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: kTitleStyle,
                        ),
                        Text(
                          'US \$ ${product.price}',
                          style: kDescriptionStyle,
                        ),
                        divider(),
                        Text(
                          'description',
                          style: kDescriptionStyle,
                        ),
                        divider(),
                        _details('Brand', product.brand),
                        _details('quantity', '1 left'),
                        _details('Category', product.productCategoryName),
                        _details('Popularity', 'Popular'),
                        Container(
                          width: double.infinity,
                          height: 232,
                          color: Colors.white60,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 13.0),
                            child: Column(
                              children: [
                                Text(
                                  'No reviews yet',
                                  style: kTitleStyle,
                                ),
                                Text(
                                  'be the first review!',
                                  style: kDescriptionStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'Suggested products: ',
                          style: kTitleStyle,
                        ),
                        divider(),
                        Container(
                          height: 400,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _products.length,
                            itemBuilder: (context, index) => FeedProducts(
                              product: _products[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Row(
        children: [
          Expanded(
            flex: 4,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'ADD TO CART',
                style: TextStyle(color: Colors.white.withOpacity(.88)),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.red,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: TextButton(
              onPressed: () {},
              child: Text('BUY NOW'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                MyAppIcons.wishlist,
                color: Colors.white.withOpacity(.88),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.grey),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _details(String title, String info) {
  return Padding(
    padding: const EdgeInsets.all(9.0),
    child: Row(
      children: [
        Text(
          '$title: ',
          style: kTitleStyle,
        ),
        Text(
          info,
          style: kDescriptionStyle,
        )
      ],
    ),
  );
}

Divider divider() => Divider(
      thickness: 1,
      color: Colors.grey,
    );
