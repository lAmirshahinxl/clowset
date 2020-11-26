import 'package:clowset/components/TextNaranji.dart';
import 'package:clowset/components/button.dart';
import 'package:clowset/components/text_underlined.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
            ),
            Text(" کد تاییدیه ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontFamily: "iran",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  decoration: TextDecoration.none,
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * .032,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .12,
              child: Text(
                  "کد تاییدیه به شماره زیر ارسال گردید لطفا انرا وارد نمایید",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontFamily: "iran",height: 1.9,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    decoration: TextDecoration.none,
                  )),
            ),
            Center(
              child: TexteNarenji(
                  text: "989383119460+", aligment: Alignment.center,size: 23.0,),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.09,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.13),
                    child: TexteNarenji(
                    text: "PIN CODE", aligment: Alignment.centerLeft  ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:27),
                    child: PinEntryTextField(
                      showFieldAsBox: false,
                      onSubmit: (String pin) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Pin"),
                                content: Text('Pin entered is $pin'),
                              );
                            }); //end showDialog()
                      }, // end onSubmit
                    ), // end PinEntryTextField()
                  ),
                ],
              ),
            ),
            ButtonBig(
              text: "تایید",
            ),
            UnderlineText(
              text: "",sending: "ارسال مجدد",
              function: () {},
            )
          ],
        ),
      ),
    );
  }
}
