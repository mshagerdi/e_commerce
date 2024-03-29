import 'package:e_commerce/consts/colors.dart';
import 'package:e_commerce/consts/constants.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  categories[index]['categoryImagePath'].toString(),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(11),
                ),
                gradient: LinearGradient(
                  colors: [
                    ColorsConsts.starterColor,
                    ColorsConsts.starterColor.withOpacity(.66),
                    // Colors.pink,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Text(
                '   ${categories[index]['categoryName'].toString()}  ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
