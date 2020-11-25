
import 'package:clowset/extension/ext.dart';
import 'package:flutter/material.dart';

class MyColors {
  static final Color native = parseColor("FF5F00");
  static final Color nativelight = parseColor("#F8A387");
  static final LinearGradient purpleGradient = LinearGradient(
      colors: [
        parseColor("8743FF").withOpacity(0.0),
        parseColor("4136F1"),
      ]
  );
  static final Color darkPurple = parseColor("#3A0088");
  static final Color black = parseColor("#000000");
  static final Color white = parseColor("#ffffff");
  static final Color sky = parseColor("#00B2AD");
  static final Color mainTitle = parseColor("#200E32");
  static final Color lightPurple = parseColor("#930077");
  static final Color mustard = parseColor("#FFBD39");
  static final Color darkPink = parseColor("#E61C5D");
  static final Color lightBlueBdgeColor = parseColor("#4F9DA2");
  static final Color lightBadgeBg = parseColor("#D3EFF1");
  static final Color successLight = parseColor("#E5F5E6");
  static final Color success = parseColor("#00A006");
  static final Color infoLight = parseColor("#EDEDFF");
  static final Color info = parseColor("#5454F8");
  static final Color nativeLighter = parseColor("#FFE6DE");
  static final Color warning = parseColor("#E67100");
  static final Color warningLight = parseColor("#FFF2E5");
  static final Color mainBg = parseColor("#F8F8F8");
  static final Color mainText = parseColor("979797");
  static final Color danger = parseColor("CE0000");
}
