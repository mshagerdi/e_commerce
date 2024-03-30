import 'package:e_commerce/consts/colors.dart';
import 'package:e_commerce/consts/my_icons.dart';
import 'package:e_commerce/widget/cart_empty.dart';
import 'package:e_commerce/widget/cart_full.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    List products = [];
    return !products.isEmpty
        ? Scaffold(body: CartEmpty())
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
              title: Text('Cart Items Count'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(MyAppIcons.trash),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                itemBuilder: (context, index) => CartFull(),
                itemCount: 5,
              ),
            ),
            bottomSheet: checkoutSection(),
          );
  }

  Widget checkoutSection() {
    return Container(
      padding: EdgeInsets.only(top: 9, left: 9, right: 9),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: .5,
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Checkout',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[800],
            ),
          ),
          Row(
            children: [
              Text(
                'Total: ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'US \$179.990',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
