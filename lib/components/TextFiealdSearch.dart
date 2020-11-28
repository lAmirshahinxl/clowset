import 'package:clowset/styles/styles.dart';
import 'package:flutter/material.dart';

class TextFiealdSearch extends StatefulWidget {
  final controller;
  final hintText;
  final maxLength;

  TextFiealdSearch(this.controller, this.hintText, this.maxLength);

  @override
  _TextFiealdSearchState createState() => _TextFiealdSearchState();
}

class _TextFiealdSearchState extends State<TextFiealdSearch> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: widget.controller,
          keyboardType: TextInputType.text,
          style: MyStyles.textFieldStyleLogin,
          maxLength: widget.maxLength,
          maxLines: 1,
          decoration: InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.only(right: 10, left: 20),
              hintText: widget.hintText,
              hintStyle: MyStyles.textFieldHintStyle,
              border: InputBorder.none,
              icon: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ))),
        ),
      ),
    );
  }
}
