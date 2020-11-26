
import 'package:clowset/pages/Favorit.dart';
import 'package:clowset/pages/Home.dart';
import 'package:clowset/pages/SabadKharid.dart';
import 'package:clowset/pages/Search.dart';
import 'package:clowset/pages/SelectGenderPage.dart';
import 'package:clowset/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
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
      SelectGender(),
      Favorit(),
      Search(),
      SabadKharid(),
      HomePage()
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/profine.png" ) ,
        title: ("پروفایل"),
        activeColor: MyColors.orang,
        inactiveColor: MyColors.gray,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/favori.png"),
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
        icon: Image.asset("assets/cart.png"),
        title: ("سبد خرید"),
        activeColor: MyColors.orang,
        inactiveColor: MyColors.gray,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/home.png") ,
        title: ("خانه"),
        activeColor: MyColors.orang,
        inactiveColor: MyColors.gray,
      ),
    ];
  }
// amir dolam lat
// my Comment
}
