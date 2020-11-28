import 'package:clowset/core/service/Service.dart';
import 'package:flutter/material.dart';

class ShopViewPager extends StatefulWidget {

  final MyService service;
  final String id;

  ShopViewPager(this.service , this.id);

  @override
  _ShopViewPagerState createState() => _ShopViewPagerState();
}

class _ShopViewPagerState extends State<ShopViewPager> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
