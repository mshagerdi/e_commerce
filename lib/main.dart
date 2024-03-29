import 'package:e_commerce/provider/category_data_provider.dart';
import 'package:e_commerce/provider/dark_theme_provider.dart';
import 'package:e_commerce/provider/page_navigator_provider.dart';
import 'package:e_commerce/screens/bottom_bar.dart';
import 'package:e_commerce/screens/cart.dart';
import 'package:e_commerce/screens/feeds.dart';
import 'package:e_commerce/screens/home.dart';
import 'package:e_commerce/screens/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  CategoryDataProvider categoryDataProvider = CategoryDataProvider();
  PageNavigatorProvider pageNavigatorProvider = PageNavigatorProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    getCurrentAppTheme();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => themeChangeProvider,
        ),
        ChangeNotifierProvider(
          create: (_) => categoryDataProvider,
        ),
        ChangeNotifierProvider(
          create: (_) => pageNavigatorProvider,
        )
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          title: 'ECommerce App',
          theme: value.darkTheme ? ThemeData.dark() : ThemeData.light(),
          // theme: Styles.themeData(themeChangeProvider.darkTheme, context),
          // home: BottomBarScreen(),
          initialRoute: BottomBarScreen.routeName,
          routes: {
            BottomBarScreen.routeName: (context) => BottomBarScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            CartScreen.routeName: (context) => CartScreen(),
            FeedsScreen.routeName: (context) => FeedsScreen(),
            UserInfoScreen.routeName: (context) => UserInfoScreen(),
          },
        ),
      ),
    );
  }
}
