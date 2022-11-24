import 'dart:convert';
/// meta : {"code":"200","status":"success","message":"list:"}
/// data : {"history":null,"latest":[{"id":11,"created_at":"2022-11-23T15:26:52.000000Z","updated_at":"2022-11-23T15:26:52.000000Z","user_id":1,"price":"15000.00","image":null,"status":"Belum Dibayar"},{"id":17,"created_at":"2022-11-24T08:15:00.000000Z","updated_at":"2022-11-24T08:15:00.000000Z","user_id":1,"price":"15000.00","image":null,"status":"Belum Dibayar"}],"waiting":[{"id":1,"created_at":"2022-11-22T14:17:17.000000Z","updated_at":"2022-11-24T08:26:57.000000Z","user_id":1,"price":"15000.00","image":"http://pitrash.masuk.web.id/images/transaction/20221124152657.jpg","status":"Menunggu Verifikasi"}]}

TransactionModel transactionModelFromJson(String str) => TransactionModel.fromJson(json.decode(str));
String transactionModelToJson(TransactionModel data) => json.encode(data.toJson());
class TransactionModel {
  TransactionModel({
      Meta? meta, 
      Data? data,}){
    _meta = meta;
    _data = data;
}

  TransactionModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Meta? _meta;
  Data? _data;
TransactionModel copyWith({  Meta? meta,
  Data? data,
}) => TransactionModel(  meta: meta ?? _meta,
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

/// history : null
/// latest : [{"id":11,"created_at":"2022-11-23T15:26:52.000000Z","updated_at":"2022-11-23T15:26:52.000000Z","user_id":1,"price":"15000.00","image":null,"status":"Belum Dibayar"},{"id":17,"created_at":"2022-11-24T08:15:00.000000Z","updated_at":"2022-11-24T08:15:00.000000Z","user_id":1,"price":"15000.00","image":null,"status":"Belum Dibayar"}]
/// waiting : [{"id":1,"created_at":"2022-11-22T14:17:17.000000Z","updated_at":"2022-11-24T08:26:57.000000Z","user_id":1,"price":"15000.00","image":"http://pitrash.masuk.web.id/images/transaction/20221124152657.jpg","status":"Menunggu Verifikasi"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      dynamic history, 
      List<Latest>? latest, 
      List<Waiting>? waiting,}){
    _history = history;
    _latest = latest;
    _waiting = waiting;
}

  Data.fromJson(dynamic json) {
    _history = json['history'];
    if (json['latest'] != null) {
      _latest = [];
      json['latest'].forEach((v) {
        _latest?.add(Latest.fromJson(v));
      });
    }
    if (json['waiting'] != null) {
      _waiting = [];
      json['waiting'].forEach((v) {
        _waiting?.add(Waiting.fromJson(v));
      });
    }
  }
  dynamic _history;
  List<Latest>? _latest;
  List<Waiting>? _waiting;
Data copyWith({  dynamic history,
  List<Latest>? latest,
  List<Waiting>? waiting,
}) => Data(  history: history ?? _history,
  latest: latest ?? _latest,
  waiting: waiting ?? _waiting,
);
  dynamic get history => _history;
  List<Latest>? get latest => _latest;
  List<Waiting>? get waiting => _waiting;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['history'] = _history;
    if (_latest != null) {
      map['latest'] = _latest?.map((v) => v.toJson()).toList();
    }
    if (_waiting != null) {
      map['waiting'] = _waiting?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// created_at : "2022-11-22T14:17:17.000000Z"
/// updated_at : "2022-11-24T08:26:57.000000Z"
/// user_id : 1
/// price : "15000.00"
/// image : "http://pitrash.masuk.web.id/images/transaction/20221124152657.jpg"
/// status : "Menunggu Verifikasi"

Waiting waitingFromJson(String str) => Waiting.fromJson(json.decode(str));
String waitingToJson(Waiting data) => json.encode(data.toJson());
class Waiting {
  Waiting({
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

  Waiting.fromJson(dynamic json) {
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
Waiting copyWith({  int? id,
  String? createdAt,
  String? updatedAt,
  int? userId,
  String? price,
  String? image,
  String? status,
}) => Waiting(  id: id ?? _id,
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

/// id : 11
/// created_at : "2022-11-23T15:26:52.000000Z"
/// updated_at : "2022-11-23T15:26:52.000000Z"
/// user_id : 1
/// price : "15000.00"
/// image : null
/// status : "Belum Dibayar"

Latest latestFromJson(String str) => Latest.fromJson(json.decode(str));
String latestToJson(Latest data) => json.encode(data.toJson());
class Latest {
  Latest({
      int? id, 
      String? createdAt, 
      String? updatedAt, 
      int? userId, 
      String? price, 
      dynamic image, 
      String? status,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userId = userId;
    _price = price;
    _image = image;
    _status = status;
}

  Latest.fromJson(dynamic json) {
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
  dynamic _image;
  String? _status;
Latest copyWith({  int? id,
  String? createdAt,
  String? updatedAt,
  int? userId,
  String? price,
  dynamic image,
  String? status,
}) => Latest(  id: id ?? _id,
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
  dynamic get image => _image;
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