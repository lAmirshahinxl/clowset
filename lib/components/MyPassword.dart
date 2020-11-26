import 'package:clowset/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyPassword extends StatelessWidget {
  final controller;
  final width;
  final height;
  final length;
  final hint;

  MyPassword(
      {this.controller, this.hint, this.width, this.height, this.length });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: width,
      height: height,
      child: TextField(
          maxLength: length,
          obscureText: true,
          textAlign: TextAlign.right,
          textInputAction: TextInputAction.next,
          maxLengthEnforced: true,
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontFamily: "iran",
            fontSize: 14,
            backgroundColor: null,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.2),
                fontFamily: "iran",
                fontSize: 14,
                backgroundColor: null,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: MyColors.mello_gray.withOpacity(0.5)),
              ),
              counterText: '',
              border: InputBorder.none,
              hintText: hint),
          keyboardType: TextInputType.text),
    );
  }
}
