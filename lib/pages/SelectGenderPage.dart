
import 'package:clowset/pages/Favorit.dart';
import 'package:clowset/pages/Home.dart';
import 'package:clowset/pages/Profile.dart';
import 'package:clowset/pages/SabadKharid.dart';
import 'package:clowset/pages/Search.dart';
import 'package:clowset/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SelectGenderPage extends StatefulWidget {
  @override
  _SelectGenderPageState createState() => _SelectGenderPageState();
}

class _SelectGenderPageState extends State<SelectGenderPage> {
  PersistentTabController _controller  = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears.
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
    curve: Curves.ease,
    ),
    screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
    animateTabTransition: true,
    curve: Curves.ease,
    duration: Duration(milliseconds: 200),
    ),
    navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
  List<Widget> _buildScreens() {
    return [
      Profile(),
      Favorit(),
      Search(),
      SabadKharid(),
      HomePage()
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.perm_identity_rounded),
        title: ("پروفایل"),
        activeColor: CupertinoColors.activeOrange,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.star_border),
        title: ("مورد علاقه"),
        activeColor: CupertinoColors.activeOrange,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("جستجو"),
        activeColor: CupertinoColors.activeOrange,
        inactiveColor: Colors.grey,
        activeContentColor: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_basket_outlined),
        title: ("سبد خرید"),
        activeColor: CupertinoColors.activeOrange,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/logo.png") , 
        title: ("خانه"),
        activeColor: CupertinoColors.activeOrange,
        inactiveColor: CupertinoColors.systemGrey,
      ),
    ];
  }
}
