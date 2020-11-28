import 'package:clowset/components/Header.dart';
import 'package:clowset/components/HeaderHome.dart';
import 'package:clowset/core/service/Service.dart';
import 'package:clowset/pages/items/HomeItem.dart';
import 'package:clowset/pages/viewPager/HomeViewPager.dart';
import 'package:clowset/pages/viewPager/ShopDasteViewPager.dart';
import 'package:clowset/pages/viewPager/ShopViewPager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  PageController pageController;

  HomePage({@required this.pageController});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _service = MyService();
  String _shopId = "";


  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: widget.pageController,
      onPageChanged: (page) => {},
      allowImplicitScrolling: false,
      pageSnapping: true,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        HomeViewPager(
          _service,
          callback: (id) {
            setState(() {
              _shopId = id;
            });
            widget.pageController.animateToPage(1,
                curve: Curves.decelerate, duration: Duration(milliseconds: 400));
          },
        ),
        ShopViewPager(_shopId, callback: (String id) {
          setState(() {
            _shopId = id;
          });
          widget.pageController.animateToPage(2,
              curve: Curves.decelerate, duration: Duration(milliseconds: 400));
        },),
        ShopDasteViewPager(_shopId, callback: (String id) {
          setState(() {
            _shopId = id;
          });
          widget.pageController.animateToPage(3,
              curve: Curves.decelerate, duration: Duration(milliseconds: 400));
        },),
      ],
    );
  }
}
