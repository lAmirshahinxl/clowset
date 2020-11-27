
import 'package:clowset/styles/colors.dart';
import 'package:flutter/material.dart';

typedef ClickedOnButton();
class ButtonBig extends StatelessWidget {
  final String text;
  final ClickedOnButton onClick;

  ButtonBig({this.text , @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25, right: 30, left: 30),
      width: double.infinity,
      height: 66,
      child: RaisedButton(
        focusColor: Colors.orangeAccent,
        highlightColor: MyColors.orang,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
        onPressed: () {
          onClick();
        },
        color: MyColors.orang,
        child: Text(
          text,
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
      ),
    );
  }
}
