/// status : "success"
/// message : ""
/// data : [{"name":"asos","kind":"0","width":"1","src":"http://clowset.com/product/banner/bp2.jpg","id_need":"asos"},{"name":"flannels","kind":"0","width":"1","src":"http://clowset.com/images/pic25.jpg?v=2","id_need":"flannels"},{"name":"boohoo","kind":"0","width":"1","src":"http://clowset.com/product/banner/bp1.jpg","id_need":"asos"},{"name":"zara","kind":"0","width":"1","src":"http://clowset.com/product/banner/bp1.jpg","id_need":"asos"},{"name":"Nike","kind":"0","width":"1","src":"http://clowset.com/product/banner/bp1.jpg","id_need":"flannels"},{"name":"test2","kind":"0","width":"1","src":"http://clowset.com/product/banner/bp3.jpg","id_need":"flannels"}]

class HomeCategoryModel {
  String _status;
  String _message;
  List<Data> _data;

  String get status => _status;
  String get message => _message;
  List<Data> get data => _data;

  HomeCategoryModel({
      String status, 
      String message, 
      List<Data> data}){
    _status = status;
    _message = message;
    _data = data;
}

  HomeCategoryModel.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "asos"
/// kind : "0"
/// width : "1"
/// src : "http://clowset.com/product/banner/bp2.jpg"
/// id_need : "asos"

class Data {
  String _name;
  String _kind;
  String _width;
  String _src;
  String _idNeed;

  String get name => _name;
  String get kind => _kind;
  String get width => _width;
  String get src => _src;
  String get idNeed => _idNeed;

  Data({
      String name, 
      String kind, 
      String width, 
      String src, 
      String idNeed}){
    _name = name;
    _kind = kind;
    _width = width;
    _src = src;
    _idNeed = idNeed;
}

  Data.fromJson(dynamic json) {
    _name = json["name"];
    _kind = json["kind"];
    _width = json["width"];
    _src = json["src"];
    _idNeed = json["id_need"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["kind"] = _kind;
    map["width"] = _width;
    map["src"] = _src;
    map["id_need"] = _idNeed;
    return map;
  }

}