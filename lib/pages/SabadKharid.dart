import 'package:clowset/components/Header.dart';
import 'package:clowset/components/button.dart';
import 'package:clowset/pages/items/SabadKharid.dart';
import 'package:clowset/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:clowset/extension/ext.dart';
class SabadKharid extends StatefulWidget {
  @override
  _SabadKharidState createState() => _SabadKharidState();
}

class _SabadKharidState extends State<SabadKharid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.backGroundBase,
      child:Column(
        children: [
          Header(text: "سبد خرید",),
          SizedBox(
            height: gh(.79),
            child:Column(
              children: [
                SabadKharidItem(title: "sdf",number: "sd",price: "sd",),
                SabadKharidItem(title: "sdf",number: "sd",price: "sd",),
                SabadKharidItem(title: "sdf",number: "sd",price: "sd",),
              ],
            )
          ),
          ButtonBig(text: "اتمام خرید",)
        ],
      )
    );
  }
}
