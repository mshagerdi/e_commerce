import 'package:e_commerce/widget/category.dart';
import 'package:e_commerce/widget/home_recently_visited_products.dart';
import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:card_swiper/card_swiper.dart';

import '../consts/constants.dart';

class FrontLayerMenu extends StatelessWidget {
  const FrontLayerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NetworkImage> _carouselImages = [
      NetworkImage('https://zariran.com/images/1.jpg'),
      NetworkImage('https://zariran.com/images/2.jpg'),
      NetworkImage('https://zariran.com/images/3.jpg'),
      NetworkImage('https://zariran.com/images/4.jpg'),
    ];

    final List<String> _popularItems = [
      'https://zariran.com/images/products/1.jpg',
      'https://zariran.com/images/products/2.jpg',
      'https://zariran.com/images/products/3.jpg',
      'https://zariran.com/images/products/4.jpg',
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            child: AnotherCarousel(
              images: _carouselImages,
              dotSize: 5.0,
              dotSpacing: 15.0,
              dotColor: Colors.lightGreenAccent,
              indicatorBgPadding: 5.0,
              dotBgColor: Colors.purple.withOpacity(0.5),
              borderRadius: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              'Categories',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 19,
              ),
            ),
          ),
          Container(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryWidget(index: index);
              },
              itemCount: categories.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              children: [
                Text(
                  'Popular Items',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'view all...',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 210,
            // width: MediaQuery.of(context).size.width * .95,
            child: Swiper(
              autoplay: true,
              onTap: (index) {},
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Container(
                      child: Image.network(
                        _popularItems[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              itemCount: _popularItems.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              'Recently Visited',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 19,
              ),
            ),
          ),
          Container(
            height: 300,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return RecentlyVisitedProducts();
              },
              itemCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}
