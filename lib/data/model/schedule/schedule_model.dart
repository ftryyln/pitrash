import 'dart:convert';
/// meta : {"code":"200","status":"success","message":"list:"}
/// data : [{"id":1,"created_at":"2022-11-19T10:55:43.000000Z","updated_at":null,"user_id":1,"day":1,"status":"Belum Bayar"}]

ScheduleModel scheduleModelFromJson(String str) => ScheduleModel.fromJson(json.decode(str));
String scheduleModelToJson(ScheduleModel data) => json.encode(data.toJson());
class ScheduleModel {
  ScheduleModel({
      Meta? meta, 
      List<Data>? data,}){
    _meta = meta;
    _data = data;
}

  ScheduleModel.fromJson(dynamic json) {
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
ScheduleModel copyWith({  Meta? meta,
  List<Data>? data,
}) => ScheduleModel(  meta: meta ?? _meta,
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
/// created_at : "2022-11-19T10:55:43.000000Z"
/// updated_at : null
/// user_id : 1
/// day : 1
/// status : "Belum Bayar"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? createdAt, 
      dynamic updatedAt, 
      int? userId, 
      int? day, 
      String? status,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userId = userId;
    _day = day;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _userId = json['user_id'];
    _day = json['day'];
    _status = json['status'];
  }
  int? _id;
  String? _createdAt;
  dynamic _updatedAt;
  int? _userId;
  int? _day;
  String? _status;
Data copyWith({  int? id,
  String? createdAt,
  dynamic updatedAt,
  int? userId,
  int? day,
  String? status,
}) => Data(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  userId: userId ?? _userId,
  day: day ?? _day,
  status: status ?? _status,
);
  int? get id => _id;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  int? get userId => _userId;
  int? get day => _day;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['user_id'] = _userId;
    map['day'] = _day;
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