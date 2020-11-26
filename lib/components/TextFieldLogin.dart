import 'package:clowset/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldLogin extends StatefulWidget {
  @override
  _TextFieldLoginState createState() => _TextFieldLoginState();

  final  controller;
  final  hintText;
  final  maxLength;
  final  isNumber;

  TextFieldLogin({this. controller, this. hintText, this.maxLength , this. isNumber});
}

class _TextFieldLoginState extends State<TextFieldLogin> {


  // "مثال : ۰۹۱۱۱۲۳۴۵۶۷"
  @override
  Widget build(BuildContext context) {
    if (widget.isNumber){
      return Card(
        elevation: 0,
        color: Colors.black.withOpacity(0.03),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14)
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            controller: widget.controller,
            keyboardType: TextInputType.number,
            style: MyStyles.textFieldStyleLogin,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
            maxLength: widget.maxLength,
            maxLines: 1,
            decoration: InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.only(right: 20 , left: 20),
                hintText: widget.hintText,
                hintStyle: MyStyles.textFieldHintStyle ,
                border: InputBorder.none
            ),
          ),
        ),
      );
    } else {
      return Card(
        elevation: 0,
        color: Colors.black.withOpacity(0.03),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14)
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            controller: widget.controller,
            keyboardType: TextInputType.text,
            style: MyStyles.textFieldStyleLogin,
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[0-9.,]')),],
            maxLength: widget.maxLength,
            maxLines: 1,
            decoration: InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.only(right: 20 , left: 20),
                hintText: widget.hintText,
                hintStyle: MyStyles.textFieldHintStyle ,
                border: InputBorder.none
            ),
          ),
        ),
      );
    }
  }

}

