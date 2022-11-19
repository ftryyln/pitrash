import 'dart:convert';
/// meta : {"code":201,"status":"success","message":"success"}
/// data : {"notification":"Pickup Sampah minggu ini","Time":"Sun, Nov 20, 2022","updated_at":"2022-11-19T17:33:01.000000Z","created_at":"2022-11-19T17:33:01.000000Z","id":3}

PushNotifModel pushNotifModelFromJson(String str) => PushNotifModel.fromJson(json.decode(str));
String pushNotifModelToJson(PushNotifModel data) => json.encode(data.toJson());
class PushNotifModel {
  PushNotifModel({
      Meta? meta, 
      Data? data,}){
    _meta = meta;
    _data = data;
}

  PushNotifModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Meta? _meta;
  Data? _data;
PushNotifModel copyWith({  Meta? meta,
  Data? data,
}) => PushNotifModel(  meta: meta ?? _meta,
  data: data ?? _data,
);
  Meta? get meta => _meta;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// notification : "Pickup Sampah minggu ini"
/// Time : "Sun, Nov 20, 2022"
/// updated_at : "2022-11-19T17:33:01.000000Z"
/// created_at : "2022-11-19T17:33:01.000000Z"
/// id : 3

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? notification, 
      String? time, 
      String? updatedAt, 
      String? createdAt, 
      int? id,}){
    _notification = notification;
    _time = time;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _notification = json['notification'];
    _time = json['Time'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _notification;
  String? _time;
  String? _updatedAt;
  String? _createdAt;
  int? _id;
Data copyWith({  String? notification,
  String? time,
  String? updatedAt,
  String? createdAt,
  int? id,
}) => Data(  notification: notification ?? _notification,
  time: time ?? _time,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  String? get notification => _notification;
  String? get time => _time;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notification'] = _notification;
    map['Time'] = _time;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}

/// code : 201
/// status : "success"
/// message : "success"

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