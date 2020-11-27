import 'package:bot_toast/bot_toast.dart';
import 'package:clowset/pages/Home.dart';
import 'package:clowset/pages/Login.dart';
import 'package:clowset/pages/Pages.dart';
import 'package:clowset/pages/Register.dart';
import 'package:clowset/pages/SabadKharid.dart';
import 'package:clowset/pages/SelectGenderPage.dart';
import 'package:clowset/pages/Splash.dart';
import 'package:clowset/styles/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
        initialRoute: "/test",
        routes: {
          '/splash': (context) => SplashScreen(),
          '/selectGender': (context) => SelectGender(),
          '/login': (context) => Login(),
          '/register': (context) => RegisterPage(),
          '/test': (context) => BuyPages(),
        },
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        title: MyStrings.appTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "iran",
          /*pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: ZoomSlideUpTransitionsBuilder(),
            TargetPlatform.fuchsia: ZoomSlideUpTransitionsBuilder(),
            TargetPlatform.windows: ZoomSlideUpTransitionsBuilder(),
            TargetPlatform.macOS: ZoomSlideUpTransitionsBuilder(),
            TargetPlatform.linux: ZoomSlideUpTransitionsBuilder(),
          }),*/
        ));
  }
}


