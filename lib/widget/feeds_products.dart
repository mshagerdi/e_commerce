import 'package:e_commerce/inner_screens/product_details.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class FeedProducts extends StatelessWidget {
  FeedProducts({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(ProductDetails.routeName,
            arguments: {'productAttributes': product}),
        child: Container(
          height: 392,
          width: 250,
          child: Card(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    badges.Badge(
                      // position: badges.BadgePosition.topEnd(top: -10, end: -12),
                      showBadge: true,
                      ignorePointer: false,
                      onTap: () {},
                      badgeContent: Text(
                        'New',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      badgeAnimation: badges.BadgeAnimation.fade(
                        animationDuration: Duration(seconds: 2),
                        colorChangeAnimationDuration: Duration(seconds: 4),
                        loopAnimation: false,
                        curve: Curves.fastOutSlowIn,
                        colorChangeAnimationCurve: Curves.easeInCubic,
                      ),
                      badgeStyle: badges.BadgeStyle(
                        shape: badges.BadgeShape.square,
                        badgeColor: Colors.pink,
                        padding: EdgeInsets.all(5),
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(8)),
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          '\$ ${product.price}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quantity 1',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_horiz,
                              color: Colors.grey,
                              size: 21,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
