import 'dart:convert';
/// meta : {"code":"200","status":"success","message":"list:"}
/// data : [{"id":1,"created_at":"2022-11-19T09:04:53.000000Z","updated_at":"2022-11-19T17:34:14.000000Z","user_id":1,"price":"300000.00","image":"http://pitrash.masuk.web.id/images/transaction/202211192239241.jpg","status":"cpanel gblg"},{"id":2,"created_at":"2022-11-19T09:04:53.000000Z","updated_at":"2022-11-19T09:04:53.000000Z","user_id":2,"price":"300000.00","image":"http://pitrash.masuk.web.id/images/transaction/","status":"Belum bayar"},{"id":3,"created_at":"2022-11-19T09:04:53.000000Z","updated_at":"2022-11-19T09:04:53.000000Z","user_id":3,"price":"300000.00","image":"http://pitrash.masuk.web.id/images/transaction/","status":"Belum bayar"},{"id":4,"created_at":"2022-11-19T09:04:53.000000Z","updated_at":"2022-11-19T09:04:53.000000Z","user_id":4,"price":"300000.00","image":"http://pitrash.masuk.web.id/images/transaction/","status":"Belum bayar"},{"id":5,"created_at":"2022-11-19T09:04:53.000000Z","updated_at":"2022-11-19T09:04:53.000000Z","user_id":5,"price":"300000.00","image":"http://pitrash.masuk.web.id/images/transaction/","status":"Belum bayar"},{"id":6,"created_at":"2022-11-19T09:04:53.000000Z","updated_at":"2022-11-19T09:04:53.000000Z","user_id":6,"price":"300000.00","image":"http://pitrash.masuk.web.id/images/transaction/","status":"Belum bayar"}]

HistoryTransactionModel historyTransactionModelFromJson(String str) => HistoryTransactionModel.fromJson(json.decode(str));
String historyTransactionModelToJson(HistoryTransactionModel data) => json.encode(data.toJson());
class HistoryTransactionModel {
  HistoryTransactionModel({
      Meta? meta, 
      List<Data>? data,}){
    _meta = meta;
    _data = data;
}

  HistoryTransactionModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  Meta? _meta;
  List<Data>? _data;
HistoryTransactionModel copyWith({  Meta? meta,
  List<Data>? data,
}) => HistoryTransactionModel(  meta: meta ?? _meta,
  data: data ?? _data,
);
  Meta? get meta => _meta;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// created_at : "2022-11-19T09:04:53.000000Z"
/// updated_at : "2022-11-19T17:34:14.000000Z"
/// user_id : 1
/// price : "300000.00"
/// image : "http://pitrash.masuk.web.id/images/transaction/202211192239241.jpg"
/// status : "cpanel gblg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? createdAt, 
      String? updatedAt, 
      int? userId, 
      String? price, 
      String? image, 
      String? status,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userId = userId;
    _price = price;
    _image = image;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _userId = json['user_id'];
    _price = json['price'];
    _image = json['image'];
    _status = json['status'];
  }
  int? _id;
  String? _createdAt;
  String? _updatedAt;
  int? _userId;
  String? _price;
  String? _image;
  String? _status;
Data copyWith({  int? id,
  String? createdAt,
  String? updatedAt,
  int? userId,
  String? price,
  String? image,
  String? status,
}) => Data(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  userId: userId ?? _userId,
  price: price ?? _price,
  image: image ?? _image,
  status: status ?? _status,
);
  int? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get userId => _userId;
  String? get price => _price;
  String? get image => _image;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['user_id'] = _userId;
    map['price'] = _price;
    map['image'] = _image;
    map['status'] = _status;
    return map;
  }

}

/// code : "200"
/// status : "success"
/// message : "list:"

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));
String metaToJson(Meta data) => json.encode(data.toJson());
class Meta {
  Meta({
      String? code, 
      String? status, 
      String? message,}){
    _code = code;
    _status = status;
    _message = message;
}

  Meta.fromJson(dynamic json) {
    _code = json['code'];
    _status = json['status'];
    _message = json['message'];
  }
  String? _code;
  String? _status;
  String? _message;
Meta copyWith({  String? code,
  String? status,
  String? message,
}) => Meta(  code: code ?? _code,
  status: status ?? _status,
  message: message ?? _message,
);
  String? get code => _code;
  String? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}