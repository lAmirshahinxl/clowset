import 'package:clowset/components/Header.dart';
import 'package:clowset/components/button.dart';
import 'package:clowset/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clowset/extension/ext.dart';
class BuyPages extends StatefulWidget {
  @override
  _BuyPagesState createState() => _BuyPagesState();
}

class _BuyPagesState extends State<BuyPages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.backGroundBase,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Header(text: "سفارشات من",),
            Container(
              height: gw(.06),

            ),
            Container(
              color: Colors.black,
              height: gh(.75),
            ),
            ButtonBig(text: "اتمام خرید",)
          ]),
    );
  }
}
