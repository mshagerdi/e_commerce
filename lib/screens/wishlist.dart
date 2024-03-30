import 'package:e_commerce/consts/colors.dart';
import 'package:e_commerce/consts/my_icons.dart';
import 'package:e_commerce/widget/wishlist_empty.dart';
import 'package:e_commerce/widget/wishlist_full.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist_screen';

  Widget build(BuildContext context) {
    List wishlistList = [];
    return !wishlistList.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorsConsts.starterColor,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              title: Text('Wishlist'),
            ),
            body: Container(
              padding: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                itemBuilder: (context, index) => WishlistFull(),
                itemCount: 5,
              ),
            ),
          );
  }
}
