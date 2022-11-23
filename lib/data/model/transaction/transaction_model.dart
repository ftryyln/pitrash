import 'dart:convert';
/// meta : {"code":"200","status":"success","message":"list:"}
/// data : {"history":[{"id":2,"created_at":"2022-11-22T14:17:17.000000Z","updated_at":"2022-11-23T12:00:32.000000Z","user_id":2,"price":"15000.00","image":"http://pitrash.masuk.web.id/images/transaction/202211231900322.jpg","status":"Sudah Dibayar"}],"latest":[{"id":7,"created_at":"2022-11-22T14:36:59.000000Z","updated_at":"2022-11-22T14:36:59.000000Z","user_id":2,"price":"15000.00","image":"http://pitrash.masuk.web.id/images/transaction","status":"Belum Dibayar"}]}

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

/// history : [{"id":2,"created_at":"2022-11-22T14:17:17.000000Z","updated_at":"2022-11-23T12:00:32.000000Z","user_id":2,"price":"15000.00","image":"http://pitrash.masuk.web.id/images/transaction/202211231900322.jpg","status":"Sudah Dibayar"}]
/// latest : [{"id":7,"created_at":"2022-11-22T14:36:59.000000Z","updated_at":"2022-11-22T14:36:59.000000Z","user_id":2,"price":"15000.00","image":"http://pitrash.masuk.web.id/images/transaction","status":"Belum Dibayar"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<History>? history, 
      List<Latest>? latest,}){
    _history = history;
    _latest = latest;
}

  Data.fromJson(dynamic json) {
    if (json['history'] != null) {
      _history = [];
      json['history'].forEach((v) {
        _history?.add(History.fromJson(v));
      });
    }
    if (json['latest'] != null) {
      _latest = [];
      json['latest'].forEach((v) {
        _latest?.add(Latest.fromJson(v));
      });
    }
  }
  List<History>? _history;
  List<Latest>? _latest;
Data copyWith({  List<History>? history,
  List<Latest>? latest,
}) => Data(  history: history ?? _history,
  latest: latest ?? _latest,
);
  List<History>? get history => _history;
  List<Latest>? get latest => _latest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_history != null) {
      map['history'] = _history?.map((v) => v.toJson()).toList();
    }
    if (_latest != null) {
      map['latest'] = _latest?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 7
/// created_at : "2022-11-22T14:36:59.000000Z"
/// updated_at : "2022-11-22T14:36:59.000000Z"
/// user_id : 2
/// price : "15000.00"
/// image : "http://pitrash.masuk.web.id/images/transaction"
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
  String? _image;
  String? _status;
Latest copyWith({  int? id,
  String? createdAt,
  String? updatedAt,
  int? userId,
  String? price,
  String? image,
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

/// id : 2
/// created_at : "2022-11-22T14:17:17.000000Z"
/// updated_at : "2022-11-23T12:00:32.000000Z"
/// user_id : 2
/// price : "15000.00"
/// image : "http://pitrash.masuk.web.id/images/transaction/202211231900322.jpg"
/// status : "Sudah Dibayar"

History historyFromJson(String str) => History.fromJson(json.decode(str));
String historyToJson(History data) => json.encode(data.toJson());
class History {
  History({
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

  History.fromJson(dynamic json) {
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
History copyWith({  int? id,
  String? createdAt,
  String? updatedAt,
  int? userId,
  String? price,
  String? image,
  String? status,
}) => History(  id: id ?? _id,
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