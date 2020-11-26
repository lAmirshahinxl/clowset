import 'package:clowset/extension/ext.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class MyStyles {
  static final textFieldStyleLogin = TextStyle(
      color: parseColor("666666"),
      fontFamily: "iran",
      fontSize: 12,
      fontWeight: FontWeight.normal);

  static final textFieldHintStyle = TextStyle(
    color: Colors.black.withOpacity(0.8),
    fontFamily: "iran",
    fontSize: 17,
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
