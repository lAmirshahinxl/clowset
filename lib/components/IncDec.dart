import 'package:clowset/components/CircleButton.dart';
import 'package:clowset/styles/styles.dart';
import 'package:flutter/material.dart';

class IncDec extends StatefulWidget {
  var counting = 0;
  @override
  _IncDecState createState() => _IncDecState();

  int getNumber(){
    return counting;
  }
}

class _IncDecState extends State<IncDec> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleButton(
          icon: Icons.remove,
          controller: () {
            if(widget.counting>0){
              setState(() {
                widget.counting --;
              });

            }
          },
        ),
        Container(
          child: Text(
            widget.counting.toString(),
            style: MyStyles.textIncDec,
          ),
          margin: EdgeInsets.only(right: 6, left: 6),
        ),
        CircleButton(
          icon: Icons.add,
          controller: () {
            if(widget.counting<99){
              setState(() {
                widget.counting ++;
              });
            }
          },
        ),
      ],
    );
  }
}
