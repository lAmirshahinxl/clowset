
class ShopBannerModel {
  String _status;
  String _message;
  Data _data;

  String get status => _status;
  String get message => _message;
  Data get data => _data;

  ShopBannerModel({
      String status, 
      String message, 
      Data data}){
    _status = status;
    _message = message;
    _data = data;
}

  ShopBannerModel.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}

/// base : {"shop_name":"asos","bg_src":"http://clowset.com/images/defalt.gif","name_src":"http://clowset.com/images/asos.png"}
/// listt : [{"name":"asos","kind":"1","width":"1","src":"http://clowset.com/product/banner/bp2.jpg","id_need":"asos"},{"name":"boohoo","kind":"1","width":"1","src":"http://clowset.com/product/banner/bp1.jpg","id_need":"asos"},{"name":"zara","kind":"1","width":"1","src":"http://clowset.com/product/banner/bp1.jpg","id_need":"asos"}]

class Data {
  Base _base;
  List<Listt> _listt;

  Base get base => _base;
  List<Listt> get listt => _listt;

  Data({
      Base base, 
      List<Listt> listt}){
    _base = base;
    _listt = listt;
}

  Data.fromJson(dynamic json) {
    _base = json["base"] != null ? Base.fromJson(json["base"]) : null;
    if (json["list"] != null) {
      _listt = [];
      json["list"].forEach((v) {
        _listt.add(Listt.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_base != null) {
      map["base"] = _base.toJson();
    }
    if (_listt != null) {
      map["list"] = _listt.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "asos"
/// kind : "1"
/// width : "1"
/// src : "http://clowset.com/product/banner/bp2.jpg"
/// id_need : "asos"

class Listt {
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

  Listt({
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

  Listt.fromJson(dynamic json) {
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

/// shop_name : "asos"
/// bg_src : "http://clowset.com/images/defalt.gif"
/// name_src : "http://clowset.com/images/asos.png"

class Base {
  String _shopName;
  String _bgSrc;
  String _nameSrc;

  String get shopName => _shopName;
  String get bgSrc => _bgSrc;
  String get nameSrc => _nameSrc;

  Base({
      String shopName, 
      String bgSrc, 
      String nameSrc}){
    _shopName = shopName;
    _bgSrc = bgSrc;
    _nameSrc = nameSrc;
}

  Base.fromJson(dynamic json) {
    _shopName = json["shop_name"];
    _bgSrc = json["bg_src"];
    _nameSrc = json["name_src"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["shop_name"] = _shopName;
    map["bg_src"] = _bgSrc;
    map["name_src"] = _nameSrc;
    return map;
  }

}