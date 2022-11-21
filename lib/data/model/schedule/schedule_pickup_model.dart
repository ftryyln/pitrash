import 'dart:convert';
/// meta : {"code":200,"status":"success","message":" list :"}
/// data : {"id":3,"created_at":"2022-11-21T12:56:45.000000Z","updated_at":null,"user_id":2,"Date":"2022-12-04 00:00:00","Due_Date":"2022-12-04 00:00:00","Category":"Pickup"}

SchedulePickupModel schedulePickupModelFromJson(String str) => SchedulePickupModel.fromJson(json.decode(str));
String schedulePickupModelToJson(SchedulePickupModel data) => json.encode(data.toJson());
class SchedulePickupModel {
  SchedulePickupModel({
      Meta? meta, 
      Data? data,}){
    _meta = meta;
    _data = data;
}

  SchedulePickupModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Meta? _meta;
  Data? _data;
SchedulePickupModel copyWith({  Meta? meta,
  Data? data,
}) => SchedulePickupModel(  meta: meta ?? _meta,
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

/// id : 3
/// created_at : "2022-11-21T12:56:45.000000Z"
/// updated_at : null
/// user_id : 2
/// Date : "2022-12-04 00:00:00"
/// Due_Date : "2022-12-04 00:00:00"
/// Category : "Pickup"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? createdAt, 
      dynamic updatedAt, 
      int? userId, 
      String? date, 
      String? dueDate, 
      String? category,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userId = userId;
    _date = date;
    _dueDate = dueDate;
    _category = category;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _userId = json['user_id'];
    _date = json['Date'];
    _dueDate = json['Due_Date'];
    _category = json['Category'];
  }
  int? _id;
  String? _createdAt;
  dynamic _updatedAt;
  int? _userId;
  String? _date;
  String? _dueDate;
  String? _category;
Data copyWith({  int? id,
  String? createdAt,
  dynamic updatedAt,
  int? userId,
  String? date,
  String? dueDate,
  String? category,
}) => Data(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  userId: userId ?? _userId,
  date: date ?? _date,
  dueDate: dueDate ?? _dueDate,
  category: category ?? _category,
);
  int? get id => _id;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  int? get userId => _userId;
  String? get date => _date;
  String? get dueDate => _dueDate;
  String? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['user_id'] = _userId;
    map['Date'] = _date;
    map['Due_Date'] = _dueDate;
    map['Category'] = _category;
    return map;
  }

}

/// code : 200
/// status : "success"
/// message : " list :"

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