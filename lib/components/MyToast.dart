import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyToast extends StatelessWidget {
  String _text;
  Color _backgroundColor;


  MyToast(this._text, this._backgroundColor);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      color: _backgroundColor.withOpacity(0.8),
      child: Padding(
        padding: EdgeInsets.only(left: 20 , right: 23, top: 10 , bottom: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            _text,
            style: TextStyle(
                color: Colors.white,
                fontFamily: "iran",
                fontSize: 15,
                fontWeight: FontWeight.normal
            ),
          ),
        ),
      ),
    );
  }
}
