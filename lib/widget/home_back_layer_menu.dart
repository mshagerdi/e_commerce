import 'package:e_commerce/consts/colors.dart';
import 'package:e_commerce/consts/constants.dart';
import 'package:e_commerce/consts/my_icons.dart';
import 'package:e_commerce/provider/page_navigator_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackLayerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsConsts.starterColor,
                Colors.transparent,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        backgroundBox(
            top: -100, left: 140, angel: -.5, boxWidth: 150, boxHeight: 250),
        backgroundBox(
            bottom: 0, right: 100, angel: -.8, boxWidth: 150, boxHeight: 300),
        backgroundBox(
            top: -50, left: 60, angel: -.5, boxWidth: 150, boxHeight: 200),
        backgroundBox(
            bottom: 10, right: 0, angel: -.8, boxWidth: 150, boxHeight: 200),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(11),
                height: 121,
                width: 121,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white54,
                      Colors.transparent,
                    ],
                    begin: const FractionalOffset(0.5, 0.5),
                    end: const FractionalOffset(1.0, 1.0),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image: DecorationImage(
                      image: NetworkImage(myAvatarUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              contentMenu(
                text: 'Feeds',
                iconData: MyAppIcons.feeds,
                context: context,
                pageIndex: 1,
              ),
              contentMenu(
                text: 'Cart',
                iconData: MyAppIcons.bag,
                context: context,
                pageIndex: 3,
              ),
              contentMenu(
                text: 'Wishlist',
                iconData: MyAppIcons.wishlist,
                context: context,
                pageIndex: 1,
              ),
              contentMenu(
                text: 'Upload a new product',
                iconData: MyAppIcons.upload,
                context: context,
                pageIndex: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  InkWell contentMenu({
    required String text,
    required IconData iconData,
    required context,
    required int pageIndex,
  }) {
    return InkWell(
      onTap: () => Provider.of<PageNavigatorProvider>(context, listen: false)
          .setPageIndex(pageIndex),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          SizedBox(width: 11),
          Icon(iconData),
        ],
      ),
    );
  }

  Positioned backgroundBox({
    double? top,
    double? left,
    double? bottom,
    double? right,
    double? angel,
    required double boxWidth,
    required double boxHeight,
  }) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Transform.rotate(
        angle: angel ?? 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.white.withOpacity(.33),
          ),
          width: boxWidth,
          height: boxHeight,
        ),
      ),
    );
  }
}
