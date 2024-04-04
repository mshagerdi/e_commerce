import 'package:e_commerce/consts/colors.dart';
import 'package:e_commerce/consts/my_icons.dart';
import 'package:e_commerce/provider/dark_theme_provider.dart';
import 'package:e_commerce/screens/cart.dart';
import 'package:e_commerce/screens/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfoScreen extends StatefulWidget {
  static const routeName = '/user_info_screen';

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late ScrollController _scrollController;
  var top = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  elevation: 4,
                  expandedHeight: 200,
                  pinned: true,
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) {
                      top = constraints.biggest.height;
                      return Container(
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
                        child: FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          centerTitle: true,
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AnimatedOpacity(
                                opacity: top <= 110 ? 1 : 0,
                                duration: Duration(milliseconds: 300),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Container(
                                      height: kToolbarHeight / 1.8,
                                      width: kToolbarHeight / 1.8,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white,
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              'https://web.mehran.im/images/Mehran%20Shagerdi.jpg'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Text(
                                      'Guest',
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          background: Image(
                            image: NetworkImage(
                                'https://web.mehran.im/images/Mehran%20Shagerdi.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      userTitle('User bag'),
                      userListTile(
                        title: 'Wishlist',
                        subtitle: '',
                        iconData: MyAppIcons.chevronRight,
                        index: 5,
                        routeName: WishlistScreen.routeName,
                        context: context,
                      ),
                      userListTile(
                        title: 'Cart',
                        subtitle: '',
                        iconData: MyAppIcons.chevronRight,
                        index: 6,
                        routeName: CartScreen.routeName,
                        context: context,
                      ),
                      userTitle('User Information'),
                      userListTile(
                        title: 'Email',
                        subtitle: 'hello@mehran.im',
                        iconData: MyAppIcons.edit,
                        index: 0,
                        context: context,
                      ),
                      userListTile(
                        title: 'Phone number',
                        subtitle: '4455',
                        iconData: MyAppIcons.edit,
                        index: 1,
                        context: context,
                      ),
                      userListTile(
                        title: 'Shipping address',
                        subtitle: '',
                        iconData: MyAppIcons.edit,
                        index: 2,
                        context: context,
                      ),
                      userListTile(
                        title: 'Joined date',
                        subtitle: 'date',
                        index: 3,
                        context: context,
                      ),
                      userTitle('User Settings'),
                      ColoredBox(
                        color: Colors.green,
                        child: Material(
                          child: SwitchListTile(
                            // tileColor: Colors.red,
                            secondary: Icon(MyAppIcons.dark),
                            title: const Text('Dark theme'),
                            value: themeChange.darkTheme,
                            onChanged: (value) {
                              setState(() {
                                themeChange.darkTheme = value;
                              });
                            },
                          ),
                        ),
                      ),
                      userListTile(
                        title: 'Logout',
                        index: 4,
                        context: context,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _buildFab(),
          ],
        ),
      ),
    );
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 33.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }

  List<IconData> userTileIcons = [
    MyAppIcons.email,
    MyAppIcons.phone,
    MyAppIcons.shipping,
    MyAppIcons.clock,
    MyAppIcons.logout,
    MyAppIcons.wishlist,
    MyAppIcons.cart,
  ];

  Widget userListTile({
    required String title,
    String? subtitle,
    required int index,
    IconData? iconData,
    String? routeName,
    required BuildContext context,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          leading: Icon(userTileIcons[index]),
          title: Text(title),
          subtitle:
              (subtitle == null || subtitle == '') ? null : Text(subtitle),
          trailing: Icon(iconData),
          onTap: () {
            routeName == null
                ? null
                : Navigator.of(context).pushNamed(routeName);
          },
        ),
      ),
    );
  }
}

Widget userTitle(String title) {
  return Padding(
    padding: const EdgeInsets.all(9.0),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.withOpacity(.66),
        ),
      ],
    ),
  );
}
