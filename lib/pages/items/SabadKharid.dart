import 'package:clowset/components/CircleButton.dart';
import 'package:clowset/components/IncDec.dart';
import 'package:clowset/extension/ext.dart';
import 'package:clowset/styles/colors.dart';
import 'package:clowset/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class SabadKharidItem extends StatefulWidget {
  final title;
  final number;
  final price;

  SabadKharidItem({this.number,this.title,this.price});
  @override
  _SabadKharidItemState createState() => _SabadKharidItemState();
}

class _SabadKharidItemState extends State<SabadKharidItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: gw(.036), right: gw(.026), top: gh(0.022)),
      height: gh(.16),
      color: MyColors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
                elevation: 7.0,
                child: Image.asset("assets/backi.png",
                    width: gw(0.24), fit: BoxFit.fitWidth)),
          ),
          SizedBox(
            width: gw(0.45),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    child: Text(
                      widget.title,
                      style: MyStyles.sabaKharidHeader,
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Row(
                    children: [
                      Align(
                        child: Text(
                          "size :",
                          style: MyStyles.textFieldStyleLogin,
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Align(
                        child: Text(
                          widget.number,
                          style: MyStyles.textFieldStyleLogin,
                        ),
                        alignment: Alignment.centerLeft,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height:gh(0.03)
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    child: Text(
                      widget.price,
                      style: MyStyles.sabadKharid_footer,
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ],
            ),
          ),
          IncDec()
        ],
      ),
    );
  }
}
