import 'dart:async';

import 'package:clowset/styles/colors.dart';
import 'package:clowset/styles/styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => {Navigator.of(context).pushReplacementNamed("/selectGender")});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2 -
                MediaQuery.of(context).size.height / 22,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 45, left: 45),
            child: Image.asset("assets/icon.png"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Text("... لباست رو انتخاب کن   ",
              style: TextStyle(
                color: Colors.black26,
                fontFamily: "iran",
                fontSize: 18,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
              ),
            ),
          ),
          Text("نیاز به راهنمایی؟",
              style: TextStyle(
                color: Colors.blue,
                fontFamily: "iran",
                decoration: TextDecoration.none,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              )),
        ],
      ),
    );
  }
}
