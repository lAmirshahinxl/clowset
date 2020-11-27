import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:clowset/components/MyEditText.dart';
import 'package:clowset/components/MyPassword.dart';
import 'package:clowset/components/TextNaranji.dart';
import 'package:clowset/components/button.dart';
import 'package:clowset/components/text_underlined.dart';
import 'package:clowset/core/models/login_model.dart';
import 'package:clowset/core/service/Service.dart';
import 'package:clowset/extension/ext.dart';
import 'package:clowset/styles/strings.dart';
import 'package:clowset/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _codeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _familyController = TextEditingController();

  final _service = MyService();

  @override
  void initState() {
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
              height: MediaQuery.of(context).size.height * .2,
            ),
            Text(MyStrings.registerWithNumber,
                textAlign: TextAlign.center, style: MyStyles.registerTitle),
            SizedBox(
              height: MediaQuery.of(context).size.height * .12,
            ),
            TexteNarenji(
                text: MyStrings.phoneNumber, aligment: Alignment.centerRight),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    MyEditText(
                        hint: "+98",
                        reg: r'[0-9]',
                        length: 3,
                        controller: _codeController,
                        inputKeyboard: TextInputType.number,
                        hintColor: Colors.black26,
                        textColor: Colors.black54,
                        width: MediaQuery.of(context).size.width * 0.16,
                        height: 50.0),
                    MyEditText(
                        hint: "9351234567",
                        reg: r'[0-9]',
                        length: 10,
                        controller: _phoneController,
                        hintColor: Colors.black26,
                        textColor: Colors.black54,
                        inputKeyboard: TextInputType.number,
                        width: MediaQuery.of(context).size.width * 0.72,
                        height: 50.0)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TexteNarenji(
                text: MyStrings.password, aligment: Alignment.centerRight),
            MyPassword(
              controller: _passwordController,
              hint: MyStrings.inputPassword,
              length: 30,
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .1,
            ),
            TexteNarenji(
                text: MyStrings.repeatPassword,
                aligment: Alignment.centerRight),
            MyPassword(
              controller: _rePasswordController,
              hint: MyStrings.inputRePassword,
              length: 22,
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .1,
            ),
            SizedBox(
              height: 10,
            ),
            TexteNarenji(
                text: MyStrings.nameFamily, aligment: Alignment.centerRight),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    MyEditText(
                        hint: "نام خانوادگی",
                        reg: r'[\w\W]*',
                        length: 15,
                        controller: _familyController,
                        inputKeyboard: TextInputType.text,
                        hintColor: Colors.black26,
                        textColor: Colors.black54,
                        textDirection: TextDirection.rtl,
                        width: MediaQuery.of(context).size.width * 0.44,
                        height: 50.0),
                    MyEditText(
                        hint: "نام",
                        reg: r'[\w\W]*',
                        length: 15,
                        textDirection: TextDirection.rtl,
                        controller: _nameController,
                        hintColor: Colors.black26,
                        textColor: Colors.black54,
                        inputKeyboard: TextInputType.text,
                        width: MediaQuery.of(context).size.width * 0.44,
                        height: 50.0)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ButtonBig(
              text: MyStrings.login,
              onClick: () {
                _callApiRegister();
              },
            ),
            UnderlineText(
              text: MyStrings.haveAccount,
              sending: MyStrings.login,
              function: () {
                Navigator.pushReplacementNamed(context, "/login");
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

  void _callApiRegister() async {
    String _name = _nameController.text.toString();
    String _family = _familyController.text.toString();
    String _code = _codeController.text.toString();
    String _phone = _phoneController.text.toString();
    String _password = _passwordController.text.toString();
    String _repeatPassword = _rePasswordController.text.toString();

/*
    SharedPreferences _pref = await SharedPreferences.getInstance();
    BotToast.showLoading();
    var model = await _service.login(
        _code, _phone, _password, _repeatPassword, _name, _family);

    if (model.error.contains("success") && model.data.token.isNotEmpty) {
      _pref.setString('sampleToken', model.data.token);
      _pref.setString('phoneNumber', _phone);
      Navigator.pushNamed(context, '/verify');
    } else {
      toast(text: model.message, color: Colors.red);
    }*/
    BotToast.showLoading();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    Timer(Duration(seconds: 2), (){
      _pref.setString('sampleToken', 'sample');
      _pref.setString('phoneNumber', _phone);
      Navigator.pushNamed(context, '/verify');
      BotToast.closeAllLoading();
    });
  }
}
