import 'package:bot_toast/bot_toast.dart';
import 'package:clowset/components/MyEditText.dart';
import 'package:clowset/components/MyPassword.dart';
import 'package:clowset/components/TextNaranji.dart';
import 'package:clowset/components/button.dart';
import 'package:clowset/components/text_underlined.dart';
import 'package:clowset/core/service/Service.dart';
import 'package:clowset/extension/ext.dart';
import 'package:clowset/styles/colors.dart';
import 'package:clowset/styles/strings.dart';
import 'package:clowset/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _phoneController = TextEditingController();
  var _codeController = TextEditingController();
  var _passwordController = TextEditingController();

  final _service = MyService();
  Future<bool> _onWillPop() async {
    Navigator.pushReplacementNamed(context, '/register');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        body:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                ),
                Text(" ورود با شماره تلفن ",
                    textAlign: TextAlign.center,
                    style: MyStyles.registerTitle),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .12,
                ),
                TexteNarenji(
                  text: "شماره همراه",aligment: Alignment.centerRight,
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
                            hintColor: Colors.black26,
                            textColor: Colors.black54,
                            width: MediaQuery.of(context).size.width * 0.16,
                            height: 50.0),
                        MyEditText(
                            hint: "9351234567",
                            reg: r'[0-9]',
                            length: 10,
                            hintColor: Colors.black26,
                            textColor: Colors.black54,
                            controller: _phoneController,
                            width: MediaQuery.of(context).size.width * 0.72,
                            height: 50.0)
                      ],
                    ),
                  ),
                ),
                TexteNarenji(
                  text: "رمز عبور ", aligment: Alignment.centerRight
                ),
                //amir in controllero khodet dorost konesh be darde sar nakhori ye vaght
                MyPassword(
                  controller: _passwordController,
                  hint: "رمز عبور را وارد نمایید",
                  length: 22,
                  width: MediaQuery.of(context).size.width * .7,
                  height: MediaQuery.of(context).size.height * .1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.12,
                ),
                ButtonBig(
                  text: "ورود", onClick: () {
                    _clickedOnLoginButton();
                },
                ),
                UnderlineText(
                  text: "حساب کاربری ندارید؟",sending: "ثبت نام",
                  function: () {
                    Navigator.pushReplacementNamed(context, "/register");
                  },
                )
              ],
            ),
        ),
      ),
    );
  }

  void _clickedOnLoginButton()async {
    String _username = _codeController.text.toString() + _phoneController.text.toString();
    String _password = _passwordController.text.toString();

    SharedPreferences _pref = await SharedPreferences.getInstance();
    BotToast.showLoading();
    var model = await _service.login(_username , _password);



    if (model.status == "success") {
      _pref.setString('token', model.data.token);
      toast(text: "ورود موفقیت آمیز", color: Colors.green);
      Navigator.pushNamedAndRemoveUntil(context, '/index',(Route<dynamic> route) => false );
    } else if (model.message == "-1"){
      toast(text: MyStrings.confirmYourPhone, color: Colors.blue);
      _pref.setString('sampleToken', model.data.token);
      _pref.setString('phoneNumber', _phoneController.text.toString());
      _pref.setString('countryCode', _codeController.text.toString());
      Navigator.pushReplacementNamed(context, '/verify');
    } else {
      toast(text: model.message, color: Colors.red);
    }
    BotToast.closeAllLoading();
  }
}
