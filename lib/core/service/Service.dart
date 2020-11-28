import 'dart:convert';
import 'package:clowset/core/models/home_category_model.dart';
import 'package:clowset/core/models/login_model.dart';
import 'package:clowset/core/models/shop_banner_model.dart';
import 'package:clowset/styles/strings.dart';
import 'package:http/http.dart' as http;

class MyService {
  Future<LoginModel> register(String code, String mobile,
      String password, String rePassword, String fName, String lName) async {
    var url = "${MyStrings.baseUrl}signupnew.php?"
        "Token=${MyStrings.baseToken}"
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


  Future<LoginModel> login(String username, String password) async {
    var url = "${MyStrings.baseUrl}login.php?"
        "Token=${MyStrings.baseToken}"
        "&username=$username"
        "&pass=$password";
    var response = await http.get(url);
    var model = LoginModel.fromJson(json.decode(response.body));
    return model;
  }

  Future<LoginModel> verify(String username, String sampleToken, String pin) async {
    var url = "${MyStrings.baseUrl}update_verify_phon.php?"
        "Token=${MyStrings.baseToken}"
        "&username=$username"
        "&pass=$sampleToken"
        "&code=$pin";
    var response = await http.get(url);
    var model = LoginModel.fromJson(json.decode(response.body));
    return model;
  }

  Future<LoginModel> sendRepeatConfirmCode (String username, String sampleToken) async {
    var url = "${MyStrings.baseUrl}verify_phon.php?"
        "Token=${MyStrings.baseToken}"
        "&username=$username"
        "&pass=$sampleToken";
    var response = await http.get(url);
    var model = LoginModel.fromJson(json.decode(response.body));
    return model;
  }

  Future<HomeCategoryModel> homeBanner() async {
    var url = "${MyStrings.baseUrl}banner_home.php?Token=${MyStrings.baseToken}";
    var response = await http.get(url);
    var model = HomeCategoryModel.fromJson(json.decode(response.body));
    return model;
  }


  Future<ShopBannerModel> shopBanner(String shopId) async {
    var url = "${MyStrings.baseUrl}banner_shop.php?"
        "Token=${MyStrings.baseToken}&shop=$shopId";
    var response = await http.get(url);
    var model = ShopBannerModel.fromJson(json.decode(response.body));
    return model;
  }

  // Future<ShopBannerModel> category(String shopId) async {
  //   var url = "${MyStrings.baseUrl}category.php?"
  //       "Token=${MyStrings.baseToken}&shop=$shopId";
  //   var response = await http.get(url);
  //   var model = ShopBannerModel.fromJson(json.decode(response.body));
  //   return model;
  // }
}
