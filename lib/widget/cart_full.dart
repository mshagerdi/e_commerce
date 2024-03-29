import 'package:e_commerce/consts/colors.dart';
import 'package:e_commerce/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartFull extends StatefulWidget {
  const CartFull({super.key});

  @override
  State<CartFull> createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    const double cardHeight = 139;
    final provider = Provider.of<DarkThemeProvider>(context);
    Color priceTheme = provider.darkTheme ? Colors.orange : Colors.brown;
    return Container(
      margin: EdgeInsets.only(left: 9, right: 9, bottom: 4, top: 4),
      width: double.infinity,
      height: cardHeight,
      child: Card(
        margin: EdgeInsets.zero,
        // clipBehavior: Clip.antiAlias,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(16),
        //     bottomRight: Radius.circular(16),
        //   ),
        // ),
        // height: 130,
        // margin: EdgeInsets.all(13),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(16),
        //     bottomRight: Radius.circular(16),
        //   ),
        //   color: Colors.red,
        // ),
        child: Row(
          children: [
            Container(
              width: cardHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://zariran.com/images/products/thumb_1070.jpg'),
                ),
              ),
            ),
            SizedBox(
              width: 13,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Title',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Price: '),
                      SizedBox(width: 5),
                      Text(
                        '425\$',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: priceTheme,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Sub Total: '),
                      SizedBox(width: 5),
                      Text(
                        '425\$',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: priceTheme,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ships free',
                        style: TextStyle(
                          color: priceTheme,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove,
                              color: Colors.red[800],
                            ),
                          ),
                          Card(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .09,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    ColorsConsts.gradiendLStart,
                                    ColorsConsts.gradiendLEnd,
                                  ],
                                  stops: [0.0, 0.7],
                                ),
                              ),
                              child: Text(
                                '3',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
