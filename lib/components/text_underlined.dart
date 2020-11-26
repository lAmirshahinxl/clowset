import 'package:clowset/styles/colors.dart';
import 'package:flutter/material.dart';

class UnderlineText extends StatelessWidget {
  final text;
  final sending;
  final function;

  UnderlineText({@required this.text, this.function, this.sending});

  @override
  Widget build(BuildContext context) {
    return Align(
        widthFactor: MediaQuery.of(context).size.width * .7,
        child: Container(
          margin: EdgeInsets.only(top: 30),
          width: MediaQuery.of(context).size.width * .7,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: function,
                child: Text(sending,
                    style: TextStyle(
                      color: Colors.blue.withOpacity(0.8),
                      fontSize: 15,
                      fontFamily: "iran",
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(width: 8,),
              Text(
                text,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 14,
                  fontFamily: "iran",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ));
  }
}
