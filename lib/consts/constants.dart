import 'package:e_commerce/consts/my_icons.dart';
import 'package:e_commerce/screens/cart.dart';
import 'package:e_commerce/screens/feeds.dart';
import 'package:e_commerce/screens/home.dart';
import 'package:e_commerce/screens/search.dart';
import 'package:e_commerce/screens/user_info.dart';
import 'package:e_commerce/screens/wishlist.dart';
import 'package:flutter/material.dart';

List<Map<String, Widget>> pages = [
  {'page': HomeScreen(), 'pageIcon': Icon(MyAppIcons.home)},
  {'page': FeedsScreen(), 'pageIcon': Icon(MyAppIcons.feeds)},
  {'page': Search(), 'pageIcon': Icon(MyAppIcons.search)},
  {'page': CartScreen(), 'pageIcon': Icon(MyAppIcons.bag)},
  {'page': UserInfoScreen(), 'pageIcon': Icon(MyAppIcons.user)},
  {'page': WishlistScreen(), 'pageIcon': Icon(MyAppIcons.wishlist)},
];

List<Map<String, Object>> categories = [
  {
    'categoryId': '001',
    'categoryName': 'Sets',
    'categoryImagePath': 'assets/images/categories_images/CatSets.jpg',
  },
  {
    'categoryId': '071',
    'categoryName': 'Half Sets',
    'categoryImagePath': 'assets/images/categories_images/CatHalfSets.jpeg',
  },
  {
    'categoryId': '023',
    'categoryName': 'Necklaces',
    'categoryImagePath': 'assets/images/categories_images/CatNecklaces.jpg',
  },
  {
    'categoryId': '042',
    'categoryName': 'Bracelets',
    'categoryImagePath': 'assets/images/categories_images/CatBracelets.jpeg',
  },
  {
    'categoryId': '052',
    'categoryName': 'Anklets',
    'categoryImagePath': 'assets/images/categories_images/CatAnklets.jpg',
  },
  {
    'categoryId': '014',
    'categoryName': 'Earrings',
    'categoryImagePath': 'assets/images/categories_images/CatEarrings.jpeg',
  },
  {
    'categoryId': '021',
    'categoryName': 'Chains',
    'categoryImagePath': 'assets/images/categories_images/CatChains.jpeg',
  },
  {
    'categoryId': '022',
    'categoryName': 'Pendants',
    'categoryImagePath': 'assets/images/categories_images/CatPendants.jpeg',
  },
  {
    'categoryId': '045',
    'categoryName': 'Rings',
    'categoryImagePath': 'assets/images/categories_images/CatRings.jpeg',
  },
  {
    'categoryId': '081',
    'categoryName': 'Gifts and kids',
    'categoryImagePath': 'assets/images/categories_images/CatGifts.jpg',
  },
];

String catAllUrl = 'assets/images/categories_images/CatAll.jpeg';
String testProductUrl = 'https://zariran.com/images/products/thumb_5083.jpg';
String myAvatarUrl = 'https://web.mehran.im/images/Mehran%20Shagerdi.jpg';
