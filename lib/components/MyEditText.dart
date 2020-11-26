import 'package:clowset/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyEditText extends StatelessWidget {
  final controller;
  final width;
  final height;
  final length;
  final hint;
  final reg;

  MyEditText({this.controller,this.reg, this.hint, this.width, this.height, this.length});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextField(
        maxLength: length,
        textInputAction: TextInputAction.next,
        maxLengthEnforced: true,
        style:TextStyle(
          color: Colors.black.withOpacity(0.6),
          fontFamily: "iran",
          fontSize: 18,
          backgroundColor: null,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.2),
            fontFamily: "iran",
            fontSize: 18,
            backgroundColor: null,
          ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MyColors.mello_gray.withOpacity(0.5)),
            ),
            counterText: '',
            border: InputBorder.none, hintText:hint),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(reg)),
          ]
      ),
    );
  }
}
