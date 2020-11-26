import 'package:clowset/extension/ext.dart';
import 'package:clowset/styles/colors.dart';
import 'package:clowset/styles/strings.dart';
import 'package:clowset/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            onPressed: () {
              _clickOnButton(false);
            },
            color: MyColors.mello_white,
            child: Text(MyStrings.imFmale, style: MyStyles.textFieldHintStyle
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
            onPressed: () {
              _clickOnButton(true);
            },
            color: MyColors.mello_white,
            child: Text(MyStrings.imMale, style: MyStyles.textFieldHintStyle
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

  void _clickOnButton(bool isMale)async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    if (isMale){
      _pref.setString('gender', 'male');
    } else {
      _pref.setString('gender', 'fmale');
    }
    Navigator.pushNamed(context, '/register');
  }
}