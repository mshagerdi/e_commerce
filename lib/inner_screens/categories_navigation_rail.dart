import 'package:e_commerce/consts/constants.dart';
import 'package:e_commerce/provider/category_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'categories_rail_widget.dart';

class CategoriesNavigationRailScreen extends StatefulWidget {
  static const routeName = '/products_navigation_rail';

  @override
  State<CategoriesNavigationRailScreen> createState() =>
      _CategoriesNavigationRailScreenState();
}

class _CategoriesNavigationRailScreenState
    extends State<CategoriesNavigationRailScreen> {
  List<NavigationRailDestination> navigationRailCategories = [];

  void getNavigationRailCategories() {
    for (Map<String, Object> category in categories) {
      navigationRailCategories.add(navigationRailDestination(
          text: category['categoryName'].toString(),
          imageAsset: category['categoryImagePath'].toString()));
    }
    navigationRailCategories.add(
      navigationRailDestination(text: 'All', imageAsset: catAllUrl),
    );
    print(navigationRailCategories.length);
  }

  @override
  void initState() {
    getNavigationRailCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategoryDataProvider>(context);
    int _selectedIndex = categoryData.getSelectedCategory;

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: NavigationRail(
                        minWidth: 55,
                        leading: Column(
                          children: [
                            Center(
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  myAvatarUrl,
                                ),
                              ),
                            ),
                            SizedBox(height: 55),
                          ],
                        ),
                        onDestinationSelected: (int index) =>
                            Provider.of<CategoryDataProvider>(context,
                                    listen: false)
                                .setSelectedCategory(index),
                        groupAlignment: 1,
                        destinations: navigationRailCategories,
                        selectedIndex: _selectedIndex,
                        labelType: NavigationRailLabelType.all,
                        selectedLabelTextStyle: TextStyle(
                          color: Color(0xffffe6bc97),
                          fontSize: 18,
                          letterSpacing: 1,
                          // decoration: TextDecoration.underline,
                          decorationThickness: 2.5,
                        ),
                        unselectedLabelTextStyle: TextStyle(
                          fontSize: 13,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            ContentSpace(_selectedIndex < categories.length
                ? categories[_selectedIndex]['categoryName'].toString()
                : 'All'),
          ],
        ),
      ),
    );
  }
}

NavigationRailDestination navigationRailDestination(
    {required String text, required String imageAsset}) {
  return NavigationRailDestination(
    icon: Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Tab(
        icon: Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.redAccent, width: 1),
            image: DecorationImage(
              image: AssetImage(imageAsset),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ),

    // SizedBox.shrink(),
    label: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          text,
          style: TextStyle(color: Colors.red),
        ),
      ),
    ),
  );
}
