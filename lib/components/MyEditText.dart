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
  final hintSize;
  final textSize;
  final Color textColor;
  final Color hintColor;
  final TextInputType inputKeyboard;
  final TextDirection textDirection;

  MyEditText({
    this.controller,
    this.reg,
    this.hint,
    this.width,
    this.height,
    this.length,
    this.hintSize,
    this.textSize,
    this.textColor,
    this.hintColor,
    this.inputKeyboard,
    this.textDirection = TextDirection.ltr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Directionality(
        textDirection: textDirection,
        child: TextField(
            controller: controller,
            maxLength: length,
            textInputAction: TextInputAction.next,
            keyboardType: inputKeyboard,
            maxLengthEnforced: true,
            style: TextStyle(
              color: textColor,
              fontFamily: "iran",
              fontSize: 14,
              backgroundColor: null,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: hintColor,
                  fontFamily: "iran",
                  fontSize: 14,
                  backgroundColor: null,
                ),
                contentPadding: EdgeInsets.only(right: 5, left: 5),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: MyColors.mello_gray.withOpacity(0.5)),
                ),
                counterText: '',
                border: InputBorder.none,
                hintText: hint),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(reg)),
            ]),
      ),
    );
  }
}
