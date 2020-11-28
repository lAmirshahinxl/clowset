import 'dart:async';
import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:clowset/components/TextNaranji.dart';
import 'package:clowset/components/button.dart';
import 'package:clowset/components/text_underlined.dart';
import 'package:clowset/core/service/Service.dart';
import 'package:clowset/extension/ext.dart';
import 'package:clowset/styles/strings.dart';
import 'package:clowset/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  var controller = TextEditingController();
  String _number = "";
  String _countryCode = "";
  String _pin = "";

  final _service = MyService();
  @override
  void initState() {
    getNumber();
    super.initState();
  }

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
            Text(MyStrings.verifyCode,
                textAlign: TextAlign.center, style: MyStyles.registerTitle),
            SizedBox(
              height: MediaQuery.of(context).size.height * .032,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .12,
              child: Text(MyStrings.verifyCodeSended,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontFamily: "iran",
                    height: 1.9,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    decoration: TextDecoration.none,
                  )),
            ),
            Center(
              child: TexteNarenji(
                text: '$_countryCode$_number+',
                aligment: Alignment.center,
                size: 20.0,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.13),
                    child: TexteNarenji(
                        text: "PIN CODE", aligment: Alignment.centerLeft),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27),
                    child: PinEntryTextField(
                      showFieldAsBox: false,
                      onSubmit: (String pin) {
                        setState(() {
                          _pin = pin;
                        });
                        _callPinApi(pin);
                      }, // end onSubmit
                    ), // end PinEntryTextField()
                  ),
                ],
              ),
            ),
            ButtonBig(
              text: "تایید",
              onClick: () {
                _callPinApi(_pin);
              },
            ),
            UnderlineText(
              text: "",
              sending: "ارسال مجدد",
              function: () {
                _callRepeatConfirmCode();
              },
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Future<void> getNumber() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      _number = _pref.getString('phoneNumber');
      _countryCode = _pref.getString('countryCode');
    });
  }

  void _callPinApi(pin) async {

    String _username = _countryCode + _number;

    SharedPreferences _pref = await SharedPreferences.getInstance();

    BotToast.showLoading();
    var model = await _service.verify(_username, _pref.getString('sampleToken'), pin);

    if (model.status == "success") {
      _pref.setString('token', _pref.getString('sampleToken'));
      toast(text: "ورود موفقیت آمیز", color: Colors.green);
      Navigator.pushNamedAndRemoveUntil(context, '/index',(Route<dynamic> route) => false );
    } else {
      toast(text: model.message, color: Colors.red);
    }
    BotToast.closeAllLoading();
  }

  void _callRepeatConfirmCode() async {
    String _username = _countryCode + _number;

    SharedPreferences _pref = await SharedPreferences.getInstance();

    BotToast.showLoading();
    var model = await _service.sendRepeatConfirmCode(_username, _pref.getString('sampleToken'));

    if (model.status == "success") {
      toast(text: "کد تایید مجدد ارسال شد", color: Colors.green);
    } else {
      toast(text: model.message, color: Colors.red);
    }
    BotToast.closeAllLoading();
  }
}
