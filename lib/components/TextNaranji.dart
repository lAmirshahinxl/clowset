import 'package:clowset/styles/colors.dart';
import 'package:flutter/material.dart';

class TexteNarenji extends StatelessWidget {
  final text;
  final aligment;
  final size;

  TexteNarenji({this.text,this.aligment,this.size=17.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30,right: 30),
      child: Align(
        alignment: aligment,
        child: Text(text,textDirection:TextDirection.rtl,style:TextStyle(
          color: MyColors.orang,
          fontFamily: "iran",
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}
