import 'package:e_commerce/consts/colors.dart';
import 'package:e_commerce/consts/my_icons.dart';
import 'package:e_commerce/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfoScreen extends StatefulWidget {
  static const routeName = '/user';

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
                      Padding(
                        padding: const EdgeInsets.only(left: 9.0),
                        child: userTitle('User Information'),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      userListTile(
                        title: 'Email',
                        subtitle: 'hello@mehran.im',
                        index: 0,
                        context: context,
                      ),
                      userListTile(
                        title: 'Phone number',
                        subtitle: '4455',
                        index: 1,
                        context: context,
                      ),
                      userListTile(
                        title: 'Shipping address',
                        subtitle: '',
                        index: 2,
                        context: context,
                      ),
                      userListTile(
                        title: 'Joined date',
                        subtitle: 'date',
                        index: 3,
                        context: context,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 9.0),
                        child: userTitle('User Settings'),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
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
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded,
  ];

  Widget userListTile({
    required String title,
    String? subtitle,
    required int index,
    required BuildContext context,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          title: Text(title),
          subtitle:
              (subtitle == null || subtitle == '') ? null : Text(subtitle!),
          leading: Icon(userTileIcons[index]),
          onTap: () {},
        ),
      ),
    );
  }
}

Widget userTitle(String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
