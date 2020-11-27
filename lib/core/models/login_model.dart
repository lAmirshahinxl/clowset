/// error : "success"
/// message : ""
/// data : {"token":"d2d384cdf13c133034bc073d69b9886d157d18553bce98d3d66fc3d729104843dd695652e388d5e46bcbe57c711f8d1a5aecf53bcfcfa6194b7274541e524555"}

class LoginModel {
  String _error;
  String _message;
  Data _data;

  String get error => _error;
  String get message => _message;
  Data get data => _data;

  LoginModel({
      String error, 
      String message, 
      Data data}){
    _error = error;
    _message = message;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _error = json["error"];
    _message = json["message"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["error"] = _error;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}

/// token : "d2d384cdf13c133034bc073d69b9886d157d18553bce98d3d66fc3d729104843dd695652e388d5e46bcbe57c711f8d1a5aecf53bcfcfa6194b7274541e524555"

class Data {
  String _token;

  String get token => _token;

  Data({
      String token}){
    _token = token;
}

  Data.fromJson(dynamic json) {
    _token = json["token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["token"] = _token;
    return map;
  }

}