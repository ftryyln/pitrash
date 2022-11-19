import 'dart:convert';
/// meta : {"code":200,"status":"   success","message":"  list   "}
/// data : [{"id":1,"notification":"Pembayaran Sampah bulan ini","isRead":0,"Time":"Sat, Nov 19, 2022","created_at":"2022-11-19T14:09:28.000000Z","updated_at":"2022-11-19T14:09:28.000000Z"},{"id":2,"notification":"Pickup Sampah minggu ini","isRead":0,"Time":"Sat, Nov 19, 2022","created_at":"2022-11-19T14:10:04.000000Z","updated_at":"2022-11-19T14:10:04.000000Z"}]

ListNotifModel listNotifModelFromJson(String str) => ListNotifModel.fromJson(json.decode(str));
String listNotifModelToJson(ListNotifModel data) => json.encode(data.toJson());
class ListNotifModel {
  ListNotifModel({
      Meta? meta, 
      List<Data>? data,}){
    _meta = meta;
    _data = data;
}

  ListNotifModel.fromJson(dynamic json) {
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
ListNotifModel copyWith({  Meta? meta,
  List<Data>? data,
}) => ListNotifModel(  meta: meta ?? _meta,
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
/// notification : "Pembayaran Sampah bulan ini"
/// isRead : 0
/// Time : "Sat, Nov 19, 2022"
/// created_at : "2022-11-19T14:09:28.000000Z"
/// updated_at : "2022-11-19T14:09:28.000000Z"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? notification, 
      int? isRead, 
      String? time, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _notification = notification;
    _isRead = isRead;
    _time = time;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _notification = json['notification'];
    _isRead = json['isRead'];
    _time = json['Time'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _notification;
  int? _isRead;
  String? _time;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  int? id,
  String? notification,
  int? isRead,
  String? time,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  notification: notification ?? _notification,
  isRead: isRead ?? _isRead,
  time: time ?? _time,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get notification => _notification;
  int? get isRead => _isRead;
  String? get time => _time;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['notification'] = _notification;
    map['isRead'] = _isRead;
    map['Time'] = _time;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// code : 200
/// status : "   success"
/// message : "  list   "

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));
String metaToJson(Meta data) => json.encode(data.toJson());
class Meta {
  Meta({
      int? code, 
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
  int? _code;
  String? _status;
  String? _message;
Meta copyWith({  int? code,
  String? status,
  String? message,
}) => Meta(  code: code ?? _code,
  status: status ?? _status,
  message: message ?? _message,
);
  int? get code => _code;
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