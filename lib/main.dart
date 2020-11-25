import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:clowset/extension/ZoomSlideUpTransitionsBuilder.dart';
import 'package:clowset/extension/ext.dart';
import 'package:clowset/pages/SelectGenderPage.dart';
import 'package:clowset/styles/colors.dart';
import 'package:clowset/styles/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:websafe_svg/websafe_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
        initialRoute: "/splash",
        routes: {
          '/splash': (context) => SplashScreen(),
          '/selectGender': (context) => SelectGenderPage(),
        },
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        title: MyStrings.appTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "iran",
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: ZoomSlideUpTransitionsBuilder(),
            TargetPlatform.fuchsia: ZoomSlideUpTransitionsBuilder(),
            TargetPlatform.windows: ZoomSlideUpTransitionsBuilder(),
            TargetPlatform.macOS: ZoomSlideUpTransitionsBuilder(),
            TargetPlatform.linux: ZoomSlideUpTransitionsBuilder(),
          }),
        ));
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => {
          Navigator.of(context).pushReplacementNamed("/selectGender")
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.white,
      child: Center(
        child: Text("splash"),
      ),
    );
  }
}

