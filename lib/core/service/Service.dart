import 'dart:convert';
import 'package:clowset/core/models/login_model.dart';
import 'package:clowset/styles/strings.dart';
import 'package:http/http.dart' as http;

class MyService {
  Future<LoginModel> login(String code, String mobile,
      String password, String rePassword, String fName, String lName) async {
    var url = "${MyStrings.baseUrl}signupnew.php?"
        "Token=2472964b11a281ec3cb7c412b17ac9fb5e"
        "&code=$code"
        "&mobile=$mobile"
        "&pass=$password"
        "&repass=$rePassword"
        "&fname=$fName"
        "&lname=$lName";
    var response = await http.get(url);
    var model = LoginModel.fromJson(json.decode(response.body));
    return model;
  }
}
