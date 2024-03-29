import 'package:e_commerce/consts/constants.dart';
import 'package:e_commerce/consts/my_icons.dart';
import 'package:e_commerce/provider/page_navigator_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PageNavigatorProvider>(context);
    final providerWithoutListener =
        Provider.of<PageNavigatorProvider>(context, listen: false);
    int _selectedPageIndex = provider.pageIndex;
    void _selectPage(int index) {
      providerWithoutListener.setPageIndex(index);
    }

    return Scaffold(
      body: pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              selectedItemColor: Colors.purple,
              unselectedItemColor: Colors.grey,
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    MyAppIcons.home,
                    size: 19,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyAppIcons.feeds,
                    size: 19,
                  ),
                  label: 'Feeds',
                ),
                BottomNavigationBarItem(
                  // activeIcon: null,
                  icon: Icon(
                    null,
                    size: 19,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyAppIcons.bag,
                    size: 19,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyAppIcons.user,
                    size: 19,
                  ),
                  label: 'User',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(9.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Search',
          child: Icon(
            MyAppIcons.search,
          ),
          onPressed: () {
            providerWithoutListener.setPageIndex(2);
          },
        ),
      ),
    );
  }
}
