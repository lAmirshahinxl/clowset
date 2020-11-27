import 'package:clowset/extension/ext.dart';
import 'package:flutter/material.dart';

class MyStyles {
  static final textFieldStyleLogin = TextStyle(
      color: parseColor("666666"),
      fontFamily: "iran",
      decoration: TextDecoration.none,
      fontSize: 14,
      fontWeight: FontWeight.normal);
  static final textIncDec = TextStyle(
      color: parseColor("#666666"),
      decoration: TextDecoration.none,
      fontFamily: "iran",
      fontSize: 14,
      fontWeight: FontWeight.bold);

  static final textFieldHintStyle = TextStyle(
    color: Colors.black.withOpacity(0.8),
    fontFamily: "iran",
    fontSize: 17,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
  );
  static final sabaKharidHeader = TextStyle(
    color: Colors.black.withOpacity(0.8),
    fontFamily: "iran",
    fontSize: 18,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
  );

  static final sabadKharid_footer = TextStyle(
    color: Colors.red.shade500,
    fontFamily: "iran",
    fontSize: 18,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
  );

  static final registerTitle = TextStyle(
    color: Colors.black54,
    fontFamily: "iran",
    fontWeight: FontWeight.bold,
    fontSize: 22,
    decoration: TextDecoration.none,
  );
}
