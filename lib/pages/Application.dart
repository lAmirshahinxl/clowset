import 'package:clowset/pages/Favorit.dart';
import 'package:clowset/pages/Home.dart';
import 'package:clowset/pages/SabadKharid.dart';
import 'package:clowset/pages/Search.dart';
import 'package:clowset/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [HomePage(), Favorit(), Search(), SabadKharid(), HomePage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_outline),
        title: ("پروفایل"),
        activeColor: MyColors.orang,
        inactiveColor: MyColors.gray,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite_border),
        title: ("مورد علاقه"),
        activeColor: MyColors.orang,
        inactiveColor: MyColors.gray,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        activeColor: MyColors.orang,
        inactiveColor: Colors.grey,
        activeContentColor: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_basket_outlined),
        title: ("سبد خرید"),
        activeColor: MyColors.orang,
        inactiveColor: MyColors.gray,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        title: ("خانه"),
        activeColor: MyColors.orang,
        inactiveColor: MyColors.gray,
      ),
    ];
  }
}
