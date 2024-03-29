import 'package:backdrop/backdrop.dart';
import 'package:e_commerce/consts/colors.dart';
import 'package:e_commerce/widget/home_back_layer_menu.dart';
import 'package:e_commerce/widget/home_front_layer_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BackdropScaffold(
          appBar: BackdropAppBar(
            title: const Text("Home"),
            leading: BackdropToggleButton(
              icon: AnimatedIcons.menu_home,
            ),
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
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://web.mehran.im/images/Mehran%20Shagerdi.jpg'),
                ),
              ),
            ],
          ),
          backLayer: BackLayerMenu(),
          backLayerBackgroundColor: Colors.transparent,
          frontLayer: FrontLayerMenu(),
        ),
      ),
    );
  }
}
