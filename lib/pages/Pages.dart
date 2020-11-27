import 'package:clowset/components/Header.dart';
import 'package:flutter/material.dart';
import 'package:clowset/extension/ext.dart';
class BuyPages extends StatefulWidget {
  @override
  _BuyPagesState createState() => _BuyPagesState();
}

class _BuyPagesState extends State<BuyPages> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Header(text: "سفارشات من",),
          SizedBox(
            height: gw(.06),
          ),
          PageView(physics: NeverScrollableScrollPhysics()  )
        ]);
  }
}
