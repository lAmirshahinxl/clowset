import 'package:bot_toast/bot_toast.dart';
import 'package:clowset/components/MyToast.dart';
import 'package:clowset/core/service/Service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color parseColor(String color) {
  String hex = color.replaceAll("#", "");
  if (hex.isEmpty) hex = "ffffff";
  if (hex.length == 3) {
    hex =
        '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
  }
  Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
  return col;
}

void toast({@required String text, @required Color color}) {
  BotToast.showCustomText(
    toastBuilder: (cancelFunc) {
      return MyToast(text, color);
    },
  );
}

Future<SharedPreferences> getSharedPreferences() async {
  return await SharedPreferences.getInstance();
}

MyService getService() {
  return new MyService();
}
