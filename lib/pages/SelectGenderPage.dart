import 'package:clowset/styles/colors.dart';
import 'package:clowset/styles/styles.dart';
import 'package:flutter/material.dart';

class SelectGender extends StatefulWidget {
  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/backi.png'),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.6,
          ),

          FlatButton(
            minWidth: 180,
            height: 65,
            onPressed: ()=>{},
            color: MyColors.mello_white,
            child: Text(' ! من خانمم', style: MyStyles.textFieldHintStyle
            ),
            textColor: MyColors.white,
            shape: RoundedRectangleBorder(side: BorderSide(
                color: Colors.orange,
                width: 1,
                style: BorderStyle.solid
            ), borderRadius: BorderRadius.circular(50)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.023,
          ),
          FlatButton(
            minWidth: 180,
            height: 65,
            onPressed: ()=>{},
            color: MyColors.mello_white,
            child: Text(' ! من آقام', style: MyStyles.textFieldHintStyle
            ),
            textColor: MyColors.white,
            shape: RoundedRectangleBorder(side: BorderSide(
                color: Colors.orange,
                width: 1,
                style: BorderStyle.solid
            ), borderRadius: BorderRadius.circular(50)),
          ),
        ],
      ),
    );
  }
}
