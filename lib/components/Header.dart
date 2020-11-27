import 'package:clowset/styles/colors.dart';
import 'package:clowset/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:clowset/extension/ext.dart';
class Header extends StatelessWidget {
  final text ;
  Header({this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:
    gh(0.08,context)
      ,
      child: Container(
        color: MyColors.white,
        child: Center(child: Text(text,style:MyStyles.registerTitle ,)),
      ),
    );
  }
}
