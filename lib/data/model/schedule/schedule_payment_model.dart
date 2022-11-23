import 'dart:convert';
/// meta : {"code":"200","status":"success","message":"list:"}
/// data : {"history":[{"id":5,"created_at":"2022-11-22T02:42:45.000000Z","updated_at":null,"user_id":1,"Begin_Date":"Tue, Nov 1, 2022","Due_Date":"Fri, Nov 25, 2022","Category":"Pembayaran"}],"incoming":[{"id":1,"created_at":"2022-11-22T02:40:22.000000Z","updated_at":null,"user_id":1,"Begin_Date":"Thu, Dec 1, 2022","Due_Date":"Sun, Dec 25, 2022","Category":"Pembayaran"}]}

SchedulePaymentModel schedulePaymentModelFromJson(String str) => SchedulePaymentModel.fromJson(json.decode(str));
String schedulePaymentModelToJson(SchedulePaymentModel data) => json.encode(data.toJson());
class SchedulePaymentModel {
  SchedulePaymentModel({
      Meta? meta, 
      Data? data,}){
    _meta = meta;
    _data = data;
}

  SchedulePaymentModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Meta? _meta;
  Data? _data;
SchedulePaymentModel copyWith({  Meta? meta,
  Data? data,
}) => SchedulePaymentModel(  meta: meta ?? _meta,
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

/// history : [{"id":5,"created_at":"2022-11-22T02:42:45.000000Z","updated_at":null,"user_id":1,"Begin_Date":"Tue, Nov 1, 2022","Due_Date":"Fri, Nov 25, 2022","Category":"Pembayaran"}]
/// incoming : [{"id":1,"created_at":"2022-11-22T02:40:22.000000Z","updated_at":null,"user_id":1,"Begin_Date":"Thu, Dec 1, 2022","Due_Date":"Sun, Dec 25, 2022","Category":"Pembayaran"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<History>? history, 
      List<Incoming>? incoming,}){
    _history = history;
    _incoming = incoming;
}

  Data.fromJson(dynamic json) {
    if (json['history'] != null) {
      _history = [];
      json['history'].forEach((v) {
        _history?.add(History.fromJson(v));
      });
    }
    if (json['incoming'] != null) {
      _incoming = [];
      json['incoming'].forEach((v) {
        _incoming?.add(Incoming.fromJson(v));
      });
    }
  }
  List<History>? _history;
  List<Incoming>? _incoming;
Data copyWith({  List<History>? history,
  List<Incoming>? incoming,
}) => Data(  history: history ?? _history,
  incoming: incoming ?? _incoming,
);
  List<History>? get history => _history;
  List<Incoming>? get incoming => _incoming;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_history != null) {
      map['history'] = _history?.map((v) => v.toJson()).toList();
    }
    if (_incoming != null) {
      map['incoming'] = _incoming?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// created_at : "2022-11-22T02:40:22.000000Z"
/// updated_at : null
/// user_id : 1
/// Begin_Date : "Thu, Dec 1, 2022"
/// Due_Date : "Sun, Dec 25, 2022"
/// Category : "Pembayaran"

Incoming incomingFromJson(String str) => Incoming.fromJson(json.decode(str));
String incomingToJson(Incoming data) => json.encode(data.toJson());
class Incoming {
  Incoming({
      int? id, 
      String? createdAt, 
      dynamic updatedAt, 
      int? userId, 
      String? beginDate, 
      String? dueDate, 
      String? category,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userId = userId;
    _beginDate = beginDate;
    _dueDate = dueDate;
    _category = category;
}

  Incoming.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _userId = json['user_id'];
    _beginDate = json['Begin_Date'];
    _dueDate = json['Due_Date'];
    _category = json['Category'];
  }
  int? _id;
  String? _createdAt;
  dynamic _updatedAt;
  int? _userId;
  String? _beginDate;
  String? _dueDate;
  String? _category;
Incoming copyWith({  int? id,
  String? createdAt,
  dynamic updatedAt,
  int? userId,
  String? beginDate,
  String? dueDate,
  String? category,
}) => Incoming(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  userId: userId ?? _userId,
  beginDate: beginDate ?? _beginDate,
  dueDate: dueDate ?? _dueDate,
  category: category ?? _category,
);
  int? get id => _id;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  int? get userId => _userId;
  String? get beginDate => _beginDate;
  String? get dueDate => _dueDate;
  String? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['user_id'] = _userId;
    map['Begin_Date'] = _beginDate;
    map['Due_Date'] = _dueDate;
    map['Category'] = _category;
    return map;
  }

}

/// id : 5
/// created_at : "2022-11-22T02:42:45.000000Z"
/// updated_at : null
/// user_id : 1
/// Begin_Date : "Tue, Nov 1, 2022"
/// Due_Date : "Fri, Nov 25, 2022"
/// Category : "Pembayaran"

History historyFromJson(String str) => History.fromJson(json.decode(str));
String historyToJson(History data) => json.encode(data.toJson());
class History {
  History({
      int? id, 
      String? createdAt, 
      dynamic updatedAt, 
      int? userId, 
      String? beginDate, 
      String? dueDate, 
      String? category,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userId = userId;
    _beginDate = beginDate;
    _dueDate = dueDate;
    _category = category;
}

  History.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _userId = json['user_id'];
    _beginDate = json['Begin_Date'];
    _dueDate = json['Due_Date'];
    _category = json['Category'];
  }
  int? _id;
  String? _createdAt;
  dynamic _updatedAt;
  int? _userId;
  String? _beginDate;
  String? _dueDate;
  String? _category;
History copyWith({  int? id,
  String? createdAt,
  dynamic updatedAt,
  int? userId,
  String? beginDate,
  String? dueDate,
  String? category,
}) => History(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  userId: userId ?? _userId,
  beginDate: beginDate ?? _beginDate,
  dueDate: dueDate ?? _dueDate,
  category: category ?? _category,
);
  int? get id => _id;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  int? get userId => _userId;
  String? get beginDate => _beginDate;
  String? get dueDate => _dueDate;
  String? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['user_id'] = _userId;
    map['Begin_Date'] = _beginDate;
    map['Due_Date'] = _dueDate;
    map['Category'] = _category;
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