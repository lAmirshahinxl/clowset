import 'package:clowset/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldLogin extends StatefulWidget {
  @override
  _TextFieldLoginState createState() => _TextFieldLoginState();

  TextEditingController _controller;
  String _hintText;
  int _maxLength;
  bool _isNumber;

  TextFieldLogin(this._controller, this._hintText, this._maxLength , this._isNumber);
}

class _TextFieldLoginState extends State<TextFieldLogin> {


  // "مثال : ۰۹۱۱۱۲۳۴۵۶۷"
  @override
  Widget build(BuildContext context) {
    if (widget._isNumber){
      return Card(
        elevation: 0,
        color: Colors.black.withOpacity(0.03),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14)
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            controller: widget._controller,
            keyboardType: TextInputType.number,
            style: MyStyles.textFieldStyleLogin,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
            maxLength: widget._maxLength,
            maxLines: 1,
            decoration: InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.only(right: 20 , left: 20),
                hintText: widget._hintText,
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
            controller: widget._controller,
            keyboardType: TextInputType.text,
            style: MyStyles.textFieldStyleLogin,
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[0-9.,]')),],
            maxLength: widget._maxLength,
            maxLines: 1,
            decoration: InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.only(right: 20 , left: 20),
                hintText: widget._hintText,
                hintStyle: MyStyles.textFieldHintStyle ,
                border: InputBorder.none
            ),
          ),
        ),
      );
    }
  }

}

