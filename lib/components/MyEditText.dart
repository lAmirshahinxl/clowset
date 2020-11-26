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

  MyEditText(
      {this.controller,
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
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextField(
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
    );
  }
}
