import 'package:clowset/extension/ext.dart';
import 'package:clowset/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class HeaderHome extends StatefulWidget {
  @override
  _HeaderHomeState createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 60,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: parseColor("d3c7aa").withOpacity(0.10),
                offset: Offset(1, 3),
                blurRadius: 5,
                spreadRadius: 0)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              print("click");
            },
              child: WebsafeSvg.asset('assets/ic-cart.svg',
                  width: 40, color: parseColor("939393"))),
          WebsafeSvg.asset('assets/clowset_text.svg',
              width: 100, color: parseColor("4e4e4e")),
          WebsafeSvg.asset('assets/ic-user.svg',
              width: 40, color: parseColor("939393")),
        ],
      ),
    );
  }
}
