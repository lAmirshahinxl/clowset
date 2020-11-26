import 'package:clowset/components/MyEditText.dart';
import 'package:clowset/components/MyPassword.dart';
import 'package:clowset/components/TextNaranji.dart';
import 'package:clowset/components/button.dart';
import 'package:clowset/components/text_underlined.dart';
import 'package:clowset/styles/colors.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontFamily: "iran",
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    decoration: TextDecoration.none,
                  )),
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
                          reg: r'[0-9\.\+]',
                          length: 3,
                          controller: controller,
                          width: MediaQuery.of(context).size.width * 0.16,
                          height: 50.0),
                      MyEditText(
                          hint: "9351234567",
                          reg: r'[0-9]',
                          length: 10,
                          controller: controller,
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
                controller: controller,
                hint: "رمز عبور را وارد نمایید",
                length: 22,
                width: MediaQuery.of(context).size.width * .7,
                height: MediaQuery.of(context).size.height * .1,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*.12,
              ),
              ButtonBig(
                text: "ورود",
              ),
              UnderlineText(
                text: "حساب کاربری ندارید؟",sending: "ثبت نام",
                function: () {
                },
              )
            ],
          ),
      ),
    );
  }
}
