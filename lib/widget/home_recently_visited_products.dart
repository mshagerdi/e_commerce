import 'package:flutter/material.dart';

class RecentlyVisitedProducts extends StatelessWidget {
  const RecentlyVisitedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 212,
      child: Card(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://zariran.com/images/products/thumb_1070.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 13,
                  top: 9,
                  child: Icon(
                    Icons.star,
                    color: Colors.grey[800],
                  ),
                ),
                Positioned(
                  right: 13,
                  top: 9,
                  child: Icon(
                    Icons.star_border_outlined,
                    color: Colors.white70,
                  ),
                ),
                Positioned(
                  right: 13,
                  bottom: 9,
                  child: Container(
                    padding: EdgeInsets.all(9),
                    child: Text(
                      '\$ 12.2',
                      style: TextStyle(
                        backgroundColor: Colors.white54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Description',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          // color: Colors.grey.shade800,
                        ),
                      ),
                      Spacer(),
                      Material(
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add_shopping_cart,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
