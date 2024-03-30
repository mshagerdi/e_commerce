import 'package:e_commerce/consts/constants.dart';
import 'package:e_commerce/consts/my_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WishlistFull extends StatelessWidget {
  const WishlistFull({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('ss'),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Icon(
            MyAppIcons.trash,
            color: Colors.white,
          ),
        ),
      ),
      child: Card(
        child: Row(
          children: [
            Container(
              height: 121,
              width: 121,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11),
                  bottomLeft: Radius.circular(11),
                ),
                image: DecorationImage(
                  image: NetworkImage(testProductUrl),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'title',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      '\$16',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Icon(
                  // size: 22,
                  MyAppIcons.trash,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
